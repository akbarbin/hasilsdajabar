class Wholeseller::OrdersController < ApplicationController
  before_filter :authenticate_user!
  layout "wholeseller"

  # GET /wholeseller/orders
  # GET /wholeseller/orders.json
  def index
    @orders = current_user.orders

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /wholeseller/orders/1
  # GET /wholeseller/orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /wholeseller/orders/new
  # GET /wholeseller/orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /wholeseller/orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /wholeseller/orders
  # POST /wholeseller/orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to wholeseller_orders_url, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wholeseller/orders/1
  # PUT /wholeseller/orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to wholeseller_orders_url, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wholeseller/orders/1
  # DELETE /wholeseller/orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to wholeseller_orders_url }
      format.json { head :no_content }
    end
  end

  def add_order
    @order = Order.find(params[:id])
  end

  def add_to_order
    @order = Order.find(params[:id])
    @order.quantity_validate = true
    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to method_payment_wholeseller_order_url(@order), notice: 'Pemesanan sudah berhasil tambahkan.' }
        format.json { head :no_content }
      else
        format.html { render action: "add_order" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def method_payment
    @order = Order.find(params[:id])
  end

  def update_method_payment
    @order = Order.find(params[:id])
    @order.payment_method = true
    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to finish_transaction_wholeseller_order_url(@order), notice: 'Pemilihan metode payment sudah berhasil.' }
        format.json { head :no_content }
      else
        format.html { render action: "method_payment" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def finish_transaction
    @order = Order.find_by_id(params[:id])
  end
end
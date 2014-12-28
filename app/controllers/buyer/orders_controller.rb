class Buyer::OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_user_by_type_user
  layout "buyer"

  # GET /buyer/orders
  # GET /buyer/orders.json
  def index
    @orders = current_user.orders

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /buyer/orders/1
  # GET /buyer/orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /buyer/orders/new
  # GET /buyer/orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /buyer/orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /buyer/orders
  # POST /buyer/orders.json
  def create
    @order = current_user.orders.new(params[:order])
    @order.user_type = "Buyer"
    respond_to do |format|
      if @order.save
        format.html { redirect_to method_payment_buyer_order_url(@order), notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buyer/orders/1
  # PUT /buyer/orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to buyer_orders_url, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buyer/orders/1
  # DELETE /buyer/orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to buyer_orders_url }
      format.json { head :no_content }
    end
  end

  def add_order
    @order = Order.find(params[:id])
  end

  def add_to_order
    @order = Order.find(params[:id])
    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to method_payment_buyer_order_url(@order), notice: 'Pemesanan sudah berhasil tambahkan.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def method_payment
    @order = Order.find(params[:id])
  end

  def update_method_payment
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to finish_transaction_buyer_order_url(@order), notice: 'Pemilihan metode payment sudah berhasil.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def finish_transaction
    @order = Order.find_by_id(params[:id])
  end
end
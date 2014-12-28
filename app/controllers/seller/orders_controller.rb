class Seller::OrdersController < ApplicationController
  before_filter :authenticate_user!
  layout "seller"

  # GET /seller/orders
  # GET /seller/orders.json
  def index
    @orders = Order.find_by_sql(
      <<-SQL
      SELECT * FROM `orders`
        INNER JOIN posts ON posts.id = orders.post_id
      WHERE posts.user_id = #{current_user.id}
      SQL
    )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /seller/orders/1
  # GET /seller/orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /seller/orders/new
  # GET /seller/orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /seller/orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /seller/orders
  # POST /seller/orders.json
  def create
    @order = Order.new(params[:seller_order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seller/orders/1
  # PUT /seller/orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:seller_order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seller/orders/1
  # DELETE /seller/orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to seller_orders_url }
      format.json { head :no_content }
    end
  end
end
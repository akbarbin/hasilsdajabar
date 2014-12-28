class Seller::BergainsController < ApplicationController
  before_filter :authenticate_user!
  layout "seller"

  # GET /seller/bergains
  # GET /seller/bergains.json
  def index
    @bergains = Post.find_by_sql(
      <<-SQL
        SELECT * FROM `posts`
        INNER JOIN users ON posts.user_id = users.id
        INNER JOIN orders ON orders.post_id = posts.id
        INNER JOIN bergains ON bergains.order_id = orders.id
        WHERE users.id = #{current_user.id}
      SQL
    )
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bergains }
    end
  end

  # GET /seller/bergains/1
  # GET /seller/bergains/1.json
  def show
    @bergain = Bergain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bergain }
    end
  end

  # GET /seller/bergains/new
  # GET /seller/bergains/new.json
  def new
    @bergain = Bergain.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bergain }
    end
  end

  # GET /seller/bergains/1/edit
  def edit
    @bergain = Bergain.find(params[:id])
  end

  # POST /seller/bergains
  # POST /seller/bergains.json
  def create
    @bergain = Bergain.new(params[:bergain])

    respond_to do |format|
      if @bergain.save
        format.html { redirect_to seller_bergains_url, notice: 'Bergain was successfully created.' }
        format.json { render json: @bergain, status: :created, location: @bergain }
      else
        format.html { render action: "new" }
        format.json { render json: @bergain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seller/bergains/1
  # PUT /seller/bergains/1.json
  def update
    @bergain = Bergain.find(params[:id])

    respond_to do |format|
      if @bergain.update_attributes(params[:bergain])
        format.html { redirect_to seller_bergains_url, notice: 'Bergain was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bergain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seller/bergains/1
  # DELETE /seller/bergains/1.json
  def destroy
    @bergain = Bergain.find(params[:id])
    @bergain.destroy

    respond_to do |format|
      format.html { redirect_to seller_bergains_url }
      format.json { head :no_content }
    end
  end
end
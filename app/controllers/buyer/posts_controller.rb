class Buyer::PostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_post, :only => [:show, :add_to_order]
  layout "buyer"

  # GET /buyer/posts
  # GET /buyer/posts.json
  def index
    @posts = Post.joins(:user).where(["posts.user_id IS NOT NULL AND users.type_user = ? AND posts.post_id IS NOT NULL", "Wholeseller"])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def berganing_product_price
    @order = Order.find_by_id(session[:order_id])
    @bergain = Bergain.new
  end

  def my_post
    @posts = Post.joins(:user).where(["posts.user_id IS NOT NULL AND users.type_user = ? AND posts.post_id IS NOT NULL AND posts.user_id = ?", "buyer", current_user.id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def finish_transaction
    @order = Order.find_by_id(session[:order_id])
    session[:order_id] = nil
  end

  def finish_bergaining
    @order = Order.find_by_id(session[:order_id])
    @bergain = Bergain.find_by_id(session[:bergain_id])
    session[:order_id] = nil
    session[:bergain_id] = nil
  end

  # GET /buyer/posts/1
  # GET /buyer/posts/1.json
  def show
    @order = Order.new
    @bergain = Bergain.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

    # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to my_post_buyer_posts_path, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def find_post
    @post = Post.find_by_id(params[:id])
    if @post.nil?
      respond_to do |format|
        format.html { redirect_to seller_posts_url }
        format.json { head :no_content }
      end
    end
  end
end

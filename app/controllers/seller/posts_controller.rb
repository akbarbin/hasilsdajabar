class Seller::PostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]
  layout "seller"

  # GET /seller/posts
  # GET /seller/posts.json
  def index
    @posts = current_user.posts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /seller/posts/1
  # GET /seller/posts/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /seller/posts/new
  # GET /seller/posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /seller/posts/1/edit
  def edit
  end

  # POST /seller/posts
  # POST /seller/posts.json
  def create
    @post = current_user.posts.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to seller_posts_url, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seller/posts/1
  # PUT /seller/posts/1.json
  def update
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to seller_posts_url, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seller/posts/1
  # DELETE /seller/posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to seller_posts_url }
      format.json { head :no_content }
    end
  end

  private
  def find_post
    @post = current_user.posts.find_by_id(params[:id])
    if @post.nil?
      respond_to do |format|
        format.html { redirect_to seller_posts_url }
        format.json { head :no_content }
      end
    end
  end
end
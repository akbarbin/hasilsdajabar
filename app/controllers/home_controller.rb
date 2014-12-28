class HomeController < ApplicationController
  def index
  end

  def search
    @posts = Post.where(["title LIKE (?) AND description LIKE (?)", "%#{params[:name]}%", "%#{params[:name]}%"])
    flash[:error] = "Tidak ditemukan" if @posts.blank?
  end
end
class PostsController < ApplicationController
  #before_action :authenticate_user!, except: [:index, :show]

  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all.order(created_at: "DESC").includes(:user)
  end

  def show
    
  end
end

class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @posts = Post.includes(:user).all.order("created_at DESC")
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "登録しました"
      redirect_to root_url
    else
      render 'posts/new'
    end
  end
  

  private
    def post_params
      params.require(:post).permit(:content).merge(user_id: current_user.id)
    end
end

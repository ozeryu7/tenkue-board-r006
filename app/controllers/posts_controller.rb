class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "登録しました"
      redirect_to root_url
    else
      render 'posts/new'
    end
  end
  
  def index
    @posts = Post.all.order(created_at: "DESC").includes(:user)
  end

  def show
    
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end

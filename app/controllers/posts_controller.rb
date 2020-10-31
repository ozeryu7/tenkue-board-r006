class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_admin!, except: [:index, :show, :new, :create]

  def index
    @posts = Post.includes(:user).all.order("created_at DESC")
  end

  def show
    @post = Post.includes(:user).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "登録しました"
      redirect_to root_url
    else
      render 'posts/new'
    end
  end

  def edit

  end

  def destroy 

  end

  private
    def post_params
      params.require(:post).permit(:content).merge(user_id: current_user.id)
    end

    def authenticate_admin!
      @post = Post.includes(:user).find(params[:id])
      
      if @post.user_id != current_user.id
        flash[:notice] = "権限はありません"
        redirect_to root_url
      end
    end
end

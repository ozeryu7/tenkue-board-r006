class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.includes(:user).all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
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

  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "編集しました"
      redirect_to root_url
    else
      render 'posts/edit'
    end
  end

  def destroy 
    @post.destroy
    flash[:notice] = "削除しました"
    redirect_to root_url
  end

  private
    def post_params
      params.require(:post).permit(:content).merge(user_id: current_user.id)
    end
end

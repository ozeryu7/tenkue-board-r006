class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:edit, :update, :destroy]

  def edit
    @comment = Comment.find(params[:id])
    @post = find_post(@comment.post_id)
    @comments = @post.comments.includes(:user).order("created_at DESC")
  end

  def create
    @post = find_post(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "コメントを(140文字以内で)入力してください。"
      redirect_to post_path(@post.id)
    end
  end

  def update
    comment_params[:post_id] = @comment.post_id
    if @comment.update_attributes(comment_params)
      redirect_to post_path(@comment.post_id)
    else
      flash[:alert] = "コメントを(140文字以内で)入力してください。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post = find_post(params[:post_id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:comment).merge(user_id: current_user.id)
    end

    def authenticate_admin!
      @comment = Comment.find(params[:id])
      
      if @comment.user_id != current_user.id
        flash[:notice] = "権限はありません"
        redirect_to post_path(@comment.post_id)
      end
    end

    def find_post(post_id)
      Post.find(post_id)
    end
end

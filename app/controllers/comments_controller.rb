class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:edit, :update, :destroy]

  def edit
    @post = Post.find(params[:id])
    @comments = @post.comments.order("created_at DESC")
    @comment = @post.comments.build(user_id: current_user.id, post_id: @post.id) if current_user
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "コメントを(140文字以内で)入力してください。"
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to post_path(@comment.post_id)
    else
      render 'comments/edit'
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "削除しました"
    redirect_to root_url
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
end

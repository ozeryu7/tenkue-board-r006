class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "コメントを(140文字以内で)入力してください。"
      redirect_to post_path(@post.id)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment).merge(user_id: current_user.id)
    end
end

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = @post.comment.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "コメントを(140文字以内で)入力してください。"
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :user_id, :post_id)
    end
end

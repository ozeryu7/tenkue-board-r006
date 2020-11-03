class CommentsController < ApplicationController
  def edit
    
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "コメントを(140文字以内で)入力してください。"
      redirect_back(fallback_location: root_path)
    end
  end

  def update

  end

  def destroy

  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :user_id, :post_id)
    end

    def authenticate_admin!
      @post = Post.find(params[:id])
      
      if @post.user_id != current_user.id
        flash[:notice] = "権限はありません"
        redirect_to root_url
      end
    end
end

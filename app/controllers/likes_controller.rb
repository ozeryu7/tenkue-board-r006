class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.create(user_id: current_user.id, post_id: @post.id)
  end

  def destroy
    
  end
end

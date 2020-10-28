class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: "DESC").includes(:user)
  end
end

class LikesController < ApplicationController
  before_action :find_post

  def create
    if already_liked?
      destroy
    else
      @post.likes.create(
        user_id: current_user.id,
        post_id: params[:post_id]
      )
    end
  end

  private

  def find_post
    @post = Post.find_by(id: params[:post_id])
  end

  def destroy
    Like.delete_by(user_id: current_user.id, post_id: params[:post_id])
  end

  def already_liked?
    Like.find_by(post_id: params[:post_id], user_id: current_user.id)
  end
end

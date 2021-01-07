class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.create(comment_params)
    
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
  end

  def create_from_index
    @post = Post.find(params['comment']['post_id'])
    @post.comments.create(
      user_id: current_user.id,
      body: params['comment']['body']
    )
    redirect_to posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end

  def find_post
    @post = Post.find_by(id: params[:post_id])
  end
end
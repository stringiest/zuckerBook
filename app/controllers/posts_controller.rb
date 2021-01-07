class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  helper_method :liked?

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_id: session[:user_id], body: params[:post][:body])
    if @post.save
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_url
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  def liked?(post)
    return false unless current_user

    Like.find_by(post_id: post.id, user_id: current_user.id)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
end

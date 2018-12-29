class PostsController < ApplicationController
  before_action :signed_in , only: [:new, :create]

  def post_params
    params.require(:post).permit(:username, :title, :content)
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to posts_path
    else
      flash.now[:danger] = "Something went wrong, please repeat the process"
      render :new
    end
  end

end

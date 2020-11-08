class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update show destroy]
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
    redirect_to root_path unless current_user == @post.user
  end

  def update
    if @post.update(post_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    # @post = Post.find(params[:id])
    if current_user == @post.user
      @post.destroy
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:text, :video).merge(user_id: 1)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

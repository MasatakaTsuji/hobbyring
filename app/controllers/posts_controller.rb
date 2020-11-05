class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.vaild?
      @post.seve
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  # def post_params
  #   params.require(:post).permit().merge(user_id: currnt_user.id)
  # end
end

class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to posts_path(comment_params)
  end

  def show
    @comments = @post.comments
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end


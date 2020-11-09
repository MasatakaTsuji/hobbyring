class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    else
      redirect_to post_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if current_user == @comment.user
      @comment.destroy
      redirect_to @post
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end


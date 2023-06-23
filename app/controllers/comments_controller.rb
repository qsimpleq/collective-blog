class CommentsController < ApplicationController
  responders :flash
  def create
    @comment = PostComment.new(comment_params)
    @comment.save
    respond_with(@comment, location: post_path(@comment.post_id))
  end

  private

  def comment_params
    params.require(:post_comment).permit(%i[content post_id user_id ancestry])
  end
end

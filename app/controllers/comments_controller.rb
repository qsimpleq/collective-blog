class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  def show
    @comment = PostComment.new(params[:id])
    respond_with(@comment)
  end

  def create
    @comment = PostComment.new(comment_params)
    @comment.save
    respond_with(@comment, location: post_path(@comment.post_id, anchor: "post_comment_#{@comment.id}"))
  end

  private

  def comment_params
    params.require(:post_comment).permit(%i[content post_id user_id ancestry])
  end
end

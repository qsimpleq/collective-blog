class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  before_action :set_post, only: %i[create show]

  def show; end

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to post_path(@comment.post_id, anchor: "post_comment_#{@comment.id}"), tflash
    else
      redirect_to post_path(@comment.post_id), **tflash(:alert)
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(%i[content post_id user_id ancestry])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end

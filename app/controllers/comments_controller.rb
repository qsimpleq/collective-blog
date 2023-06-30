class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  before_action :set_post, only: %i[create show]

  def show; end

  def create

    cparams = comment_params
    @comment = @post.comments.build(cparams)
    @comment.user = current_user
    @comment.ancestry ||= cparams[:parent_id]

    if @comment.save
      redirect_to post_path(@comment.post_id, anchor: "post_comment_#{@comment.id}"), tflash
    else
      redirect_to post_path(@comment.post_id), **tflash(:alert)
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(%i[content parent_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  before_action :set_post, only: %i[create show]

  def show; end

  def create
    @comment = @post.post_comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@comment.post_id, anchor: "post_comment_#{@comment.id}"), tflash }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity, **tflash(:alert) }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
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

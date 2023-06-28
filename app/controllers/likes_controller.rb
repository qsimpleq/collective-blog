class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_post, only: %i[create destroy]
  include SharedPostsHelper

  def create
    like = @post.post_likes.build(like_params)
    respond_to do |format|
      if like.save
        format.html { redirect_to request.referer }
        format.json { render json: {}, status: :created }
      else
        format.html { redirect_to request.referer, status: :unprocessable_entity, **tflash(:alert) }
        format.json { render json: like.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    like = post_liked(@post)
    like.destroy

    respond_to do |format|
      format.html { redirect_to request.referer }
      format.json { head :no_content }
    end
  end

  private

  def like_params
    { user_id: current_user.id }.merge(params.permit(:post_id, :user_id))
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end

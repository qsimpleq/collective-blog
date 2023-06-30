class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_post, only: %i[create destroy]
  include SharedPostsHelper

  def create
    like = @post.post_likes.build(like_params)
    if like.save
      redirect_to request.referer
    else
      redirect_to request.referer, status: :unprocessable_entity, **tflash(:alert)
    end
  end

  def destroy
    like = post_liked(@post)
    like.destroy

    redirect_to request.referer || posts_url
  end

  private

  def like_params
    { user_id: current_user.id }.merge(params.permit(:post_id, :user_id))
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end

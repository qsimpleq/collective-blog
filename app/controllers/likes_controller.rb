class LikesController < ApplicationController
  before_action :set_post, only: %i[create destroy]
  include SharedPostsHelper

  def create
    like = PostLike.new(like_params)
    like.save
    respond_with(like, location: request.referer)
  end

  def destroy
    like = post_liked(@post)
    like.destroy
    respond_with(like, location: request.referer)
  end

  private

  def like_params
    { user_id: current_user.id }.merge(params.permit(:post_id, :user_id))
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end

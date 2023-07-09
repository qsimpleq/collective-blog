# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_post, only: %i[create destroy]

  def create
    like = @post.likes.build(like_params)
    if like.save
      redirect_to referer_or_post_url(@post)
    else
      flash[:error] = t('.error')
      redirect_to referer_or_post_url(@post), status: :found
    end
  end

  def destroy
    like = @post.liked(current_user)
    if like
      like.destroy
      redirect_to referer_or_post_url(@post)
    else
      flash[:error] = t('.error')
      redirect_to referer_or_post_url(@post), status: :found
    end
  end

  private

  def like_params
    { user_id: current_user.id }.merge(params.permit(:post_id))
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def referer_or_post_url(post)
    request.referer || post
  end
end

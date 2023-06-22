class LikesController < ApplicationController
  before_action :set_post, only: %i[create destroy]

  def create
    like = PostLike.new(like_params.merge({ user_id: current_user.id }))

    respond_to do |format|
      if like.save
        format.html { redirect_to request.referer }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to request.referer, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    like = PostLike.find(params[:id])
    like.destroy

    respond_to do |format|
      format.html { redirect_to request.referer }
      format.json { head :no_content }
    end
  end

  private

  def like_params
    params.permit(:post_id, :user_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end

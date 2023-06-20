class CommentsController < ApplicationController
  def create
    @comment = PostComment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@comment.post_id), notice: t('.success') }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(%i[content post_id user_id ancestry])
  end
end

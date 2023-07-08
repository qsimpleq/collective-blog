# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy edit new update]
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.includes(:creator).order(created_at: :desc)
  end

  # GET /posts/1 or /posts/1.json
  def show
    @root_comments = @post.comments&.roots&.order(created_at: :desc) || []
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params.merge(creator: current_user))

    if @post.save
      redirect_to @post, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to @post, notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    if @post.destroy
      redirect_to posts_url, notice: t('.success')
    else
      flash[:error] = t('.error')
      render @post, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:post_id] || params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end

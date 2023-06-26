class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy edit new update]
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.all.order('created_at DESC')
  end

  # GET /posts/1 or /posts/1.json
  def show
    @root_comments = @post.post_comments.roots.order('created_at DESC') if @post.post_comments.any?
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post), **tflash
    else
      respond_to new_post_path(@post), **tflash(:alert)
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to post_path(@post), **tflash
    else
      redirect_to edit_post_path(post_params), **tflash(:alert)
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    if @post.destroy
      redirect_to posts_path, **tflash
    else
      redirect_to post_path(@post), **tflash(:alert)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:post_id] || params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :category_id, :creator_id)
  end
end

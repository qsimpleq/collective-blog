class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy edit new update]
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.all.order('created_at DESC')
  end

  # GET /posts/1 or /posts/1.json
  def show
    @root_comments = @post.comments&.roots&.order('created_at DESC') || []
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
      redirect_to post_url(@post), tflash
    else
      redirect_to new_post_url, **tflash(:alert)
      # render :new, status: :unprocessable_entity, **tflash(:alert)
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to post_url(@post), tflash
    else
      render :edit, status: :unprocessable_entity, **tflash(:alert)
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    redirect_to posts_url, tflash
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

class PostsController < ApplicationController
  responders :flash
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.all.order('created_at DESC')
  end

  # GET /posts/1 or /posts/1.json
  def show
    @root_comments = @post.post_comments.roots.order('created_at DESC')
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
    @post.save
    respond_with(@post)
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post.update(post_params)
    respond_with(@post)
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_with(@post, location: posts_url)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :category_id, :creator_id)
  end
end

class CategoriesController < ApplicationController
  responders :flash
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    @categories = Category.all.order('name ASC')
  end

  # GET /categories/1 or /categories/1.json
  def show; end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit; end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @category.save
    respond_with(@category)
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    @category.update(category_params)
    respond_with(@category)
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy
    respond_with(@category, location: categories_url)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name)
  end
end

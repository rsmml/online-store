class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show edit update destroy]

  def index
    @categories = policy_scope(Category)
  end

  def show
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @category.update(category_params)
    redirect_to category_path(@category)
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def find_category
    @category = Category.find(params[:id])
    authorize @category
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end

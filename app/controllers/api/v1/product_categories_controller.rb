class Api::V1::ProductCategoriesController < ApplicationController
  before_action :find_product_category, only: %i[show edit update destroy]

  def index
    product_categories = policy_scope(ProductCategory)
    render json: { product_categories: product_categories }
  end

  def show
    render json: { product_category: product_category }
  end

  # def new
  #   product_category = ProductCategory.new
  #   products = Product.all
  #   categories = Category.all
  #   authorize product_category
  # end

  def create
    product_category = ProductCategory.new(product_category_params)
    authorize @product_category

    if product_category.save
      render json: { product_category: product_category }
    else
      render json: { status: 401 }
    end
  end

  def edit
    render json: { product_category: product_category }
  end

  def update
    if product_category.update(product_category_params)
      render json: { product_category: product_category }
    else
      render json: { status: 401 }
    end
  end

  def destroy
    product_category.destroy
    render json: { product_category: "deleted" }
  end

  private

  def find_product_category
    product_category = ProductCategory.find(params[:id])
    authorize product_category
  end

  def product_category_params
    params.require(:product_category).permit(:product_id, :category_id)
  end
end

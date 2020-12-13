class ProductCategoriesController < ApplicationController
  before_action :find_product_category, only: %i[show edit update destroy]

  def index
    @product_categories = ProductCategory.all
  end

  def show
  end

  def new
    @product_category = ProductCategory.new
    @products = Product.all
    @categories = Category.all
  end

  def create
    @product_category = ProductCategory.new(product_category_params)

    if @product_category.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @product_category.update(product_category_params)

    redirect_to product_category(@product_category)
  end

  def destroy
    @product_category.destroy

    redirect_to products_path
  end

  private

  def find_product_category
    @product_category = ProductCategory.find(params[:id])
  end

  def product_category_params
    params.require(:product_category).permit(:product_id, :category_id)
  end
end

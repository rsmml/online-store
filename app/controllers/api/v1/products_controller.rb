class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    products = policy_scope(Product)
    render json: { products: products }
  end

  def show
    render json: { product: product }
  end

  def edit
    render json: { product: product }
  end

  def create
    product = Product.new(product_params)
    authorize @product
    if @product.save
      render json: { status: :created, product: product }
    else
      render json: { status: 401 }
    end
  end

  def update
    if product.update(product_params)
      render json: { product: product }
    else
      render json: { status: 401 }
    end
  end

  def destroy
    product.destroy
    render json: { product: 'deleted' }
  end

  private
    def set_product
      product = Product.find(params[:id])
      authorize product
    end

    def product_params
      params.require(:product).permit(:title, :price, :stock, photos: [])
    end
end

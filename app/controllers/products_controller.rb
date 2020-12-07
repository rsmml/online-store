class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]


  def index
    @products = Product.all
  end

  def show
  end


  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def update
    @product.update(product_params)
    redirect_to products_path
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :price, photos: [])
    end
end

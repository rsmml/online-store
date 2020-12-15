class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]


  def index
    @products = policy_scope(Product)
    # respond_to do |format|
    #   format.html
    #   format.json { render json: { products: @products } }
    # end
  end

  def show
  end


  def new
    @product = Product.new
    authorize @product
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def update
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
      authorize @product
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :price, :stock, photos: [])
    end
end

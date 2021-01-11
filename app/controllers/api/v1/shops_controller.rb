class Api::V1::ShopsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def index
    products = policy_scope(Product)
    order_item = current_order.order_items.new
    render json: { products: @products, order_item: order_item }
  end

  def show
    product = Product.find(params[:id])
    authorize product
    render json: { product: product }
  end
end

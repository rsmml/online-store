class ShopsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = policy_scope(Product)

    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
    authorize @product
  end
end

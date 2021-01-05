class Api::V1::CartsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @order_items = current_order.order_items
    authorize @order_items
    render json: { order_items: @order_items }
  end

  def destroy_all
    @delete_all_orders = current_order.order_items.all
    @delete_all_orders.destroy_all
  end
end

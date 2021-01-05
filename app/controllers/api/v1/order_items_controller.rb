class Api::V1::OrderItemsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_params)
    @product = Product.find(@order_item.product.id)
    @product.stock -= 1
    @product.save
    @order.save
    session[:order_id] = @order.id
    authorize @order_item
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_params)
    @order_items = current_order.order_items
    authorize @order_item
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @product = Product.find(@order_item.product.id)
    @product.stock += 1
    @product.save
    @order_item.destroy
    @order_items = current_order.order_items
    authorize @order_item
  end

  def destroy_all
    @delete_all_orders = current_order.order_items.all
    @delete_all_orders.destroy_all
  end

  private

  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end

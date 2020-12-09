class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_params)
    @product = Product.find(@order_item.product.id)
    @product.stock -= 1
    @product.save
    @order.save
    StockChannel.broadcast_to(
      @stock,
      # render_to_string(partial: "stock", locals: { stock: @product.stock })
      "Hello There!"
    )
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_params)
    @order_items = current_order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @product = Product.find(@order_item.product.id)
    @product.stock += 1
    @product.save
    @order_item.destroy
    @order_items = current_order.order_items
  end

  private

  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end

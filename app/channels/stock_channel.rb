class StockChannel < ApplicationCable::Channel
  def subscribed
    stream_from "stock_channel_#{params[:stock_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

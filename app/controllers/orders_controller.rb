class OrdersController < ApplicationController
  def create
    @translation_service = TranslationService.find(params[:translation_service_id])
    @order = Order.new
    @order.user = current_user
    @order.translation_service = @translation_service
    @order.status = "open"
    @order.date = "hoje"
    @order.final_cost = @translation_service.price_per_hour
    if @order.save
      redirect_to translation_service_order_path(@order)
    else
      redirect_to translation_service_path
    end
  end
end

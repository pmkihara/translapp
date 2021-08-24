class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: params[:user_id])
  end

  def create
    @translation_service = TranslationService.find(params[:translation_service_id])
    @order = Order.new
    @order.user = current_user
    @order.translation_service = @translation_service
    @order.status = "open"
    @order.date = "hoje"
    @order.final_cost = @translation_service.price_per_hour
    if @order.save
      redirect_to translation_service_order_path(@translation_service, @order)
    else
      redirect_to translation_service_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
  end
end

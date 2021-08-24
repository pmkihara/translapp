class OrdersController < ApplicationController
  def index
    if owner?
      @orders = Order.where(user_id: params[:user_id], status: "active")
    else
      redirect_to root_path
      flash[:notice] = "Seu pilantra"
    end
  end

  def create
    @translation_service = TranslationService.find(params[:translation_service_id])
    @order = Order.new
    @order.user = current_user
    @order.translation_service = @translation_service
    @order.status = "active"
    @order.date = "hoje"
    @order.final_cost = @translation_service.price_per_hour
    if @order.save
      redirect_to user_order_path(@order.user, @order)
    else
      redirect_to translation_service_path
    end
  end

  def show
    if owner?
      @order = Order.find(params[:id]) if owner?
    else
      redirect_to root_path
      flash[:notice] = "Seu pilantra"
    end
  end

  def destroy
    @order = Order.find(params[:id])

    if owner?
      @order.status = "Cancelado"
      @order.save
      redirect_to user_orders_path(current_user)
      flash[:notice] = "Pedido de nº#{@order.id} cancelado com sucesso!"
    end
  end

  private

  def owner?
    user = User.find(params[:user_id])

    user == current_user
  end
end

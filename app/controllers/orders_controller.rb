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
    @order.date = "25/08/2021"
    @order.final_cost = @translation_service.price_per_hour
    @translation_service.active = false
    @translation_service.save
    if @order.save
      flash[:alert] = "Yay! 🎉 you successfully created the order"
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

  def mark_as_done
    change_status("done")
  end

  def mark_as_canceled
    change_status("canceled")
  end

  private

  def owner?
    user = User.find(params[:user_id])

    user == current_user
  end

  def change_status(status)
    if owner?
      @order = Order.find(params[:id])
      @order.status = status

      if @order.save
        redirect_to user_orders_path(current_user)
        flash[:alert] = "Order of nº#{@order.id} #{status} successfully!"
      end
    end
  end
end

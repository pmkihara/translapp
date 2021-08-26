class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    offers = Offer.where(status: "available")
    @offers = sort_by_status(offers)
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
      flash[:alert] = "Yay! 🎉 you successfully created a service"
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params)
      flash[:alert] = "Yay! 🎉 you successfully update the service"
      redirect_to offer_path(@offer)
    else
      render :edit
    end
  end

  def destroy
    @offer = Offer.find(params[:id])

    if @offer.user == current_user
      if @offer.job && @offer.job.status == "accepted"
        flash[:notice] = "You don't delete a service accepted! Please talk with your translator!"
        redirect_to request.referrer
      else
        @offer.status = "deleted"
        @offer.save
        flash[:notice] = "You successfully deleted ❌ the service"
        redirect_to user_my_services_path(current_user)
      end
    end
  end

  def my_services
    if owner?
      @offers = Offer.where(user_id: params[:user_id])
    else
      redirect_to root_path
      flash[:notice] = "Seu pilantra"
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:location, :remote, :original_language, :final_language, :description,
                                  :price_per_hour, :user_id)
  end

  def owner?
    user = User.find(params[:user_id])

    user == current_user
  end

  def sort_by_status(offers)
    array_sorted = []
    offers.each do |offer|
      if offer.status == "accepted" || offer.status == "available"
        array_sorted.unshift(offer)
      else
        array_sorted.push(offer)
      end
    end
    array_sorted
  end
end
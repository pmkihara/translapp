class TranslationServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    translation_services = TranslationService.where(status: "available")
    @translation_services = sort_by_status(translation_services)
  end

  def show
    @translation_service = TranslationService.find(params[:id])
  end

  def new
    @translation_service = TranslationService.new
  end

  def create
    @translation_service = TranslationService.new(translation_service_params)
    @translation_service.user = current_user
    if @translation_service.save
      flash[:alert] = "Yay! 🎉 you successfully created a service"
      redirect_to translation_service_path(@translation_service)
    else
      render :new
    end
  end

  def edit
    @translation_service = TranslationService.find(params[:id])
  end

  def update
    @translation_service = TranslationService.find(params[:id])
    if @translation_service.update(translation_service_params)
      flash[:alert] = "Yay! 🎉 you successfully update the service"
      redirect_to translation_service_path(@translation_service)
    else
      render :edit
    end
  end

  def destroy
    @translation_service = TranslationService.find(params[:id])

    if @translation_service.user == current_user
      if @translation_service.job && @translation_service.job.status == "accepted"
        flash[:notice] = "You don't delete a service accepted! Please talk with your translator!"
        redirect_to request.referrer
      else
        @translation_service.status = "deleted"
        @translation_service.save
        flash[:notice] = "You successfully deleted ❌ the service"
        redirect_to user_my_services_path(current_user)
      end
    end
  end

  def my_services
    if owner?
      @translation_services = TranslationService.where(user_id: params[:user_id])
    else
      redirect_to root_path
      flash[:notice] = "Seu pilantra"
    end
  end

  private

  def translation_service_params
    params.require(:translation_service).permit(:location, :remote, :original_language, :final_language, :description,
                                                :price_per_hour, :user_id)
  end

  def owner?
    user = User.find(params[:user_id])

    user == current_user
  end

  def sort_by_status(translation_services)
    array_sorted = []
    translation_services.each do |translation_service|
      if translation_service.status == "accepted" || translation_service.status == "available"
        array_sorted.unshift(translation_service)
      else
        array_sorted.push(translation_service)
      end
    end
    array_sorted
  end
end

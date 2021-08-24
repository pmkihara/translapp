class TranslationServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @translation_services = TranslationService.all
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
      redirect_to translation_service_path
    else
      render :edit
    end
  end

  private

  def translation_service_params
    params.require(:translation_service).permit(:location, :remote, :original_language, :final_language, :description,
                                                :price_per_hour, :active, :user_id)
  end
end

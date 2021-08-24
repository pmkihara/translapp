class TranslationServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @translation_services = TranslationService.all
  end

  def edit
    @translation_service = TranslationService.find(params[:id])
  end

  def update
    @translation_service = TranslationService.find(params[:id])
    if @translation_service.update(translation_params)
      redirect_to task_path, notice: 'Service was created successfully'
    else
      render :edit
  end

  private

  def translation_services_params
    params.require(:translation_service).permit(:location, :remote, :original_language, :final_language, :description, :price_per_hour, :active, :user_id)
  end
end

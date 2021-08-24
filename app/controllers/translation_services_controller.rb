class TranslationServicesController < ApplicationController
  def index
    @translation_services = TranslationService.all
  end

  def show
    @service = TranslationService.find(params[:id])
  end
end

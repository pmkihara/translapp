class TranslationServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @translation_services = TranslationService.all
  end

  def new
    @translation_service = TranslationService.new
  end
end

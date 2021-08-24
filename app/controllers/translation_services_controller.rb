class TranslationServicesController < ApplicationController
  def index
    @translation_services = TranslationService.all
  end
end

class CountriesController < ApplicationController
  include Controllers::Crudify

  model_klass Country

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:country).permit(:name, :iso_code, :ibge_code)
  end
end

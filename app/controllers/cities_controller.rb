class CitiesController < ApplicationController
  include Controllers::Crudify

  model_klass City

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:city).permit(:name, :state_id, :ibge_code)
  end
end

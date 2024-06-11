class StatesController < ApplicationController
  include Controllers::Crudify
  model_klass State

  def cities
    state = State.find(params[:id])
    @cities = state.cities.order(:name)
  end

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:state).permit(:name, :uf, :ibge_code, :country_id)
  end
end

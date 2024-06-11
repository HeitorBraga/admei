class BanksController < ApplicationController
  include Controllers::Crudify

  model_klass Bank

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:bank).permit(:code, :name)
  end
end

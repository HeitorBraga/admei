class AppsController < ApplicationController
  include Controllers::Crudify

  model_klass App

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:app).permit(:name, :tenant_id, :secret)
  end
end

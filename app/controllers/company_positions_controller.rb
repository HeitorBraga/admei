class CompanyPositionsController < ApplicationController
  include Controllers::Crudify
  model_klass CompanyPosition

  private
  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:company_position).permit(:name)
  end
end

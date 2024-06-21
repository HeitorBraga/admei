class SalesController < ApplicationController
  include Controllers::Crudify
  model_klass Sale

  private
  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:sale).permit(:date, :invoicing)
  end
end

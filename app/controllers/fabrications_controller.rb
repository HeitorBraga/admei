class FabricationsController < ApplicationController
  include Controllers::Crudify
  model_klass Fabrication

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:fabrication).permit(:date, :product_id, :quantity)
  end
end

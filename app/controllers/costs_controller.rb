class CostsController < ApplicationController
  include Controllers::Crudify
  super_model_klass ProductCost
  model_klass Cost

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:cost).permit(:product_cost_id, :ingredient, :unit, :quantity, :price,
                                 :quantity_used, :cost)
  end
end

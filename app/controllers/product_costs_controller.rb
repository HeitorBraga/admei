class ProductCostsController < ApplicationController
  include Controllers::Crudify
  after_action :set_total_cost, only: %i(create update)
  model_klass ProductCost

  def set_total_cost
    total_cost = 0.to_f
    params['product_cost']['costs_attributes'].each do |ingredient|
      total_cost += ingredient[1]['cost'].to_f
    end

    @product_cost.update(cost: total_cost.round(2))
    set_unit_cost(total_cost.round(2))
  end

  def set_unit_cost(total_cost)
    products_quantity = params['product_cost']['products_quantity'].to_f
    cost_unit = total_cost / products_quantity
    @product_cost.update(cost_unit: cost_unit.round(2))
  end

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:product_cost).permit(:product_id, :cost, :cost_unit, :products_quantity,
                                         costs_attributes: %i(id ingredient unit quantity price quantity_used cost _destroy))
  end
end

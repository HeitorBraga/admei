class ProductCostsController < ApplicationController
  include Controllers::Crudify
  model_klass ProductCost

  before_action :check_registration_path, only: %i(new index)
  before_action :check_permissions

  def create
    ProductCost.new(
      product_id: params['product_cost']['product_id'],
      products_quantity: params['product_cost']['products_quantity'],
      cost: set_total_cost,
      cost_unit: set_unit_cost
    ).save

    if params['product_cost']['costs_attributes'].present?
      params['product_cost']['costs_attributes'].each do |id, fields|
        if fields['own_product'] == "1"
          product = ProductCost.find_by(product_id: fields['product_id'])

          Cost.new(
            id: id,
            product_cost_id: ProductCost.last.id,
            ingredient: "",
            unit: "und",
            quantity: 1,
            price: product.cost_unit,
            quantity_used: 1,
            own_product: fields['own_product'],
            cost: product.cost_unit,
            product_id: fields['product_id']
          ).save
        else
          Cost.new(
            id: id,
            product_cost_id: ProductCost.last.id,
            own_product: fields['own_product'],
            ingredient: fields['ingredient'],
            unit: fields['unit'],
            quantity: fields['quantity'],
            price: fields['price'],
            quantity_used: fields['quantity_used'],
            cost: format_cost(fields['cost'], nil),
          ).save
        end
      end
    end

    redirect_to product_costs_path, notice: 'Criado com sucesso!'
  end

  def set_total_cost()
    total_cost = 0.0
    params['product_cost']['costs_attributes'].each do |ingredient|
      total_cost += format_cost(ingredient[1]['cost'], ingredient[1]['product_id'])
    end

    total_cost.round(2)
  end

  def set_unit_cost()
    products_quantity = params['product_cost']['products_quantity'].to_i
    cost_unit = set_total_cost / products_quantity

    cost_unit.round(2)
  end

  def format_cost(cost, product_id)
    if cost.present?
      cost.gsub('R$', '')[1..-1].gsub(',', '.').to_f
    else
      if product_id.present?
        product = ProductCost.find_by(product_id: product_id)

        product.cost_unit.to_f
      else
        0.0
      end
    end
  end

  private

  def check_permissions
    permission = Permission.find_by(user_id: current_user.id)
    unless permission.costs == true
      redirect_to root_url, notice: 'Você não tem permissão!'
    end
  end

  def check_registration_path
    unless Product.count > 0
      redirect_to new_product_path, notice: 'Cadastre um Produto primeiro!'
    end
  end

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:product_cost).permit(:product_id, :cost, :cost_unit, :products_quantity,
                                         costs_attributes: %i(id ingredient unit quantity price quantity_used cost own_product product_id _destroy))
  end
end

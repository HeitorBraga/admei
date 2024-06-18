class AddColumnsToProductCosts < ActiveRecord::Migration[6.1]
  def change
    add_column :product_costs, :products_quantity, :integer
    add_column :product_costs, :cost_unit, :float, null: true
  end
end

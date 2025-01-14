class AddFieldsToCosts < ActiveRecord::Migration[6.1]
  def change
    add_column :costs, :own_product, :boolean
    add_column :costs, :product_id, :integer, null: true
  end
end

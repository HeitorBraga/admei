class CreateProductCosts < ActiveRecord::Migration[6.1]
  def change
    create_table :product_costs do |t|
      t.references :product, null: false, foreign_key: true
      t.float :cost, null: true

      t.timestamps
    end
  end
end

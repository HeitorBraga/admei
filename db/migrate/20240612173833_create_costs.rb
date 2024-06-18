class CreateCosts < ActiveRecord::Migration[6.1]
  def change
    create_table :costs do |t|
      t.references :product_cost
      t.string :ingredient
      t.integer :unit
      t.integer :quantity
      t.float :price
      t.integer :quantity_used
      t.float :cost

      t.timestamps
    end
  end
end

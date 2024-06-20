class CreateSubProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_products do |t|
      t.string :name, null: false
      t.integer :quantity, null: false
      t.float :price, null: false
      t.references :spending, null: false, foreign_key: true

      t.timestamps
    end
  end
end

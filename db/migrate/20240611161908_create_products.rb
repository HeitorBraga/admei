class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.references :product_category
      t.float :price

      t.timestamps
    end
  end
end

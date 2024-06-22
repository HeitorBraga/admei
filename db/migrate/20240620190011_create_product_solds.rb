class CreateProductSolds < ActiveRecord::Migration[6.1]
  def change
    create_table :product_solds do |t|
      t.references :sale, null: false, foreign_key: true
      t.integer :product, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end

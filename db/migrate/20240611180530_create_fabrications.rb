class CreateFabrications < ActiveRecord::Migration[6.1]
  def change
    create_table :fabrications do |t|
      t.date :date, null: false
      t.references :product, null: false
      t.integer :quantity

      t.timestamps
    end
  end
end

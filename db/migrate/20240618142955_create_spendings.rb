class CreateSpendings < ActiveRecord::Migration[6.1]
  def change
    create_table :spendings do |t|
      t.string :origin, null: false
      t.date :date, null: false
      t.float :price, null: false

      t.timestamps
    end
  end
end

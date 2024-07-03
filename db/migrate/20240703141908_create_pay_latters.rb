class CreatePayLatters < ActiveRecord::Migration[6.1]
  def change
    create_table :pay_latters do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.float :price, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end

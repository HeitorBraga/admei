class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.date :date, null: false
      t.float :invoicing, null: false

      t.timestamps
    end
  end
end

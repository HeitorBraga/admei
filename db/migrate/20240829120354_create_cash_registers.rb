class CreateCashRegisters < ActiveRecord::Migration[6.1]
  def change
    create_table :cash_registers do |t|
      t.float :amount
      t.references :payment_method, null: false, foreign_key: true
      t.integer :month

      t.timestamps
    end
  end
end

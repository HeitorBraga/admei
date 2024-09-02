class AddAddMoneyToCashRegister < ActiveRecord::Migration[6.1]
  def change
    add_column :cash_registers, :add_money, :boolean, default: true
  end
end

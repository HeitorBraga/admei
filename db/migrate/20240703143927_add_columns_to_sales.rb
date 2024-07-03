class AddColumnsToSales < ActiveRecord::Migration[6.1]
  def change
    add_column :sales, :pay_latter, :boolean, default: false
    add_column :sales, :name, :string, null: true
    add_column :sales, :phone, :string, null: true
  end
end

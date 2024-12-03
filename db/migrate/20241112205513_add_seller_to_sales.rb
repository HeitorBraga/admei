class AddSellerToSales < ActiveRecord::Migration[6.1]
  def change
    add_column :sales, :for_seller, :boolean, default: false
    add_column :sales, :employee, :integer, null: true
  end
end

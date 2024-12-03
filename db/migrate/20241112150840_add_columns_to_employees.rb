class AddColumnsToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :commission, :boolean, default: false
    add_column :employees, :commission_percentage, :integer, null: true
  end
end

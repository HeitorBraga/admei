class AddFieldsToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :entred_in, :date, null: false
    add_column :employees, :came_out_in, :date, null: true
  end
end

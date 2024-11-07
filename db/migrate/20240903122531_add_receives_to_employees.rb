class AddReceivesToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :receives, :integer
    add_column :employees, :receives_when, :integer
  end
end

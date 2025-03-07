class AddUserToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_reference :employees, :user, null: false, foreign_key: true
    add_column :employees, :email, :string
  end
end

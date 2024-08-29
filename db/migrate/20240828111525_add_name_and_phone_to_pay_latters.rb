class AddNameAndPhoneToPayLatters < ActiveRecord::Migration[6.1]
  def change
    remove_column :pay_latters, :name
    remove_column :pay_latters, :phone
    add_column :pay_latters, :name, :string, null: true
    add_column :pay_latters, :phone, :string, null: true
  end
end

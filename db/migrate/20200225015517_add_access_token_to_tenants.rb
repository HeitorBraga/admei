class AddAccessTokenToTenants < ActiveRecord::Migration[6.0]
  def change
    add_column :tenants, :public_token, :string
    add_column :tenants, :secret_token, :string

    add_index :tenants, :public_token, unique: true
    add_index :tenants, :secret_token, unique: true
  end
end

class CreateTenants < ActiveRecord::Migration[6.0]
  def change
    create_table :tenants do |t|
      t.string :subdomain, null: false, limit: 20

      t.timestamps
    end
  end
end

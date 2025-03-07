class AddCompanyToPermissions < ActiveRecord::Migration[6.1]
  def change
    add_column :permissions, :company, :boolean, default: false
  end
end

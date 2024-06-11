class CreateBackofficeContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :backoffice_contracts do |t|
      t.string :contract_key
      t.integer :users
      t.integer :terminals
      t.integer :concurrent_instances
      t.integer :installations
      t.decimal :price, precision: 16, scale: 3

      t.timestamps
    end
  end
end

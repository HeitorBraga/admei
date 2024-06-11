class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name, null: false, limit: 100
      t.string :iso_code, null: false, limit: 5
      t.integer :ibge_code, null: false

      t.timestamps
    end

    add_index :countries, :iso_code, unique: true
    add_index :countries, :ibge_code, unique: true
  end
end

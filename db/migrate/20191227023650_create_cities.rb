class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false, limit: 100
      t.references :state, null: false, foreign_key: true
      t.integer :ibge_code, null: false

      t.timestamps
    end

    add_index :cities, :name
    add_index :cities, :ibge_code, unique: true
  end
end

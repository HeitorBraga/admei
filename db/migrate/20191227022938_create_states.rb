class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string :name, null: false, limit: 100
      t.string :uf, null: false, limit: 2
      t.integer :ibge_code, null: false
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end

    add_index :states, :name
    add_index :states, :ibge_code, unique: true
  end
end

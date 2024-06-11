class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :addressable_type, null: false, limit: 50
      t.integer :addressable_id
      t.string :zip, null: false, limit: 10
      t.string :address, null: false, limit: 100
      t.string :number, limit: 20
      t.string :more, limit: 100
      t.string :district, null: false, limit: 100
      t.references :city, null: false
      t.jsonb :data, null: false, default: '{}'

      t.timestamps
    end

    add_index :addresses, [:addressable_id, :addressable_type]
  end
end

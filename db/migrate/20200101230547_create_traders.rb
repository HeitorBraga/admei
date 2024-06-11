class CreateTraders < ActiveRecord::Migration[6.0]
  def change
    create_table :traders do |t|
      t.string :name, null: false, limit: 100
      t.string :legal_name, limit: 100
      t.integer :person_type, null: false, default: 0
      t.string :federal_tax_id, limit: 25
      t.string :state_tax_id, limit: 25
      t.string :municipal_tax_id, limit: 25
      t.string :gender, limit: 1
      t.string :phone, limit: 25
      t.string :mobile, limit: 25
      t.string :email
      t.date :birth_date
      t.jsonb :data, null: false, default: {}

      t.timestamps
    end
  end
end

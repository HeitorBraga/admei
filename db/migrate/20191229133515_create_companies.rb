class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :trade_name, null: false, limit: 100
      t.string :legal_name, null: false, limit: 100
      t.string :federal_tax_id, limit: 25
      t.string :state_tax_id, limit: 25

      t.timestamps
    end
  end
end
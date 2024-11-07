class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :phone
      t.references :company_position, null: false, foreign_key: true
      t.float :wage
      t.date :entry_date

      t.timestamps
    end
  end
end

class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :categories_and_products, default: false
      t.boolean :company_positions_and_employees, default: false
      t.boolean :collaborators, default: false
      t.boolean :production, default: true
      t.boolean :sales, default: false
      t.boolean :spendings, default: false
      t.boolean :payment_methods, default: false
      t.boolean :pay_latters_and_accounts_payables
      t.boolean :costs, default: false
      t.boolean :permissions, default: false

      t.timestamps
    end
  end
end

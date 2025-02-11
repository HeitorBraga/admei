class CreateAccountsPayables < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts_payables do |t|
      t.string :name
      t.date :date
      t.integer :price

      t.timestamps
    end
  end
end

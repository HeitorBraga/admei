class CreateCompanyPositions < ActiveRecord::Migration[6.1]
  def change
    create_table :company_positions do |t|
      t.string :name

      t.timestamps
    end
  end
end

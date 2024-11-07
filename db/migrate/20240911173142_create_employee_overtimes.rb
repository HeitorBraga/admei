class CreateEmployeeOvertimes < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_overtimes do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :date
      t.integer :hours

      t.timestamps
    end
  end
end

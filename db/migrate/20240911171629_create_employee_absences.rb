class CreateEmployeeAbsences < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_absences do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :date
      t.string :reason

      t.timestamps
    end
  end
end

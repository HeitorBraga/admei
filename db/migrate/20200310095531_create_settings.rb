class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.string :name, null: false, limit: 255
      t.string :value, null: false
      t.string :data_type, null: false, limit: 50

      t.timestamps
    end
  end
end

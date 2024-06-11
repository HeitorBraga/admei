class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps, id: :uuid do |t|
      t.string :name
      t.string :secret, null: false

      t.timestamps
    end
  end
end

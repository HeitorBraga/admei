class CreateProfits < ActiveRecord::Migration[6.1]
  def change
    create_table :profits do |t|

      t.timestamps
    end
  end
end

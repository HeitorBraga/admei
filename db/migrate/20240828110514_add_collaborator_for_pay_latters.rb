class AddCollaboratorForPayLatters < ActiveRecord::Migration[6.1]
  def change
    add_column :pay_latters, :collaborator, :integer, null: true
  end
end

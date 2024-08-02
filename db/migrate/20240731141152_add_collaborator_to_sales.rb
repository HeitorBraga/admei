class AddCollaboratorToSales < ActiveRecord::Migration[6.1]
  def change
    add_reference :sales, :collaborator, null: true, foreign_key: true
    add_column :sales, :for_collaborator, :boolean
  end
end

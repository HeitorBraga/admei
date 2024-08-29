class AddForCollaboratorToPayLatter < ActiveRecord::Migration[6.1]
  def change
    add_column :pay_latters, :for_collaborator, :boolean, null: true
  end
end

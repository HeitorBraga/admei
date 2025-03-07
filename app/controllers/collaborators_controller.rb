class CollaboratorsController < ApplicationController
  include Controllers::Crudify
  model_klass Collaborator

  before_action :check_permissions

  private

  def check_permissions
    permission = Permission.find_by(user_id: current_user.id)
    unless permission.collaborators == true
      redirect_to root_url, notice: 'Você não tem permissão!'
    end
  end

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:collaborator).permit(:name)
  end
end

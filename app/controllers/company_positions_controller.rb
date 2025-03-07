class CompanyPositionsController < ApplicationController
  include Controllers::Crudify
  model_klass CompanyPosition
  before_action :check_permissions

  private

  def check_permissions
    permission = Permission.find_by(user_id: current_user.id)
    unless permission.company_positions_and_employees == true
      redirect_to root_url, notice: 'Você não tem permissão!'
    end
  end

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:company_position).permit(:name)
  end
end

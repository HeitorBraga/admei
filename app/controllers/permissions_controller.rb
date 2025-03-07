class PermissionsController < ApplicationController
  include Controllers::Crudify
  model_klass Permission

  before_action :check_permissions

  def create_permissions
    Permission.new(user_id: params['user_id']).save
    redirect_to edit_permission_url(Permission.last)
  end

  private

  def check_permissions
    permission = Permission.find_by(user_id: current_user.id)
    unless permission.permissions == true
      redirect_to root_url, notice: 'Você não tem permissão!'
    end
  end

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:permission).permit(:user_id, :categories_and_products, :company_positions_and_employees,
                                       :collaborators, :production, :sales, :spendings, :payment_methods,
                                       :pay_latters_and_accounts_payables, :costs, :permissions, :company)
  end
end

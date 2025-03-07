class PaymentMethodsController < ApplicationController
  include Controllers::Crudify
  model_klass PaymentMethod

  before_action :check_permissions

  private

  def check_permissions
    permission = Permission.find_by(user_id: current_user.id)
    unless permission.payment_methods == true
      redirect_to root_url, notice: 'Você não tem permissão!'
    end
  end

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:payment_method).permit(:name)
  end
end

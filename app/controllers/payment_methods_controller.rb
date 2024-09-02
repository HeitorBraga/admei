class PaymentMethodsController < ApplicationController
  include Controllers::Crudify
  model_klass PaymentMethod

  private
  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:payment_method).permit(:name)
  end
end

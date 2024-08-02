class SalesController < ApplicationController
  include Controllers::Crudify
  before_action :pay_latter?, only: %i(create)
  model_klass Sale

  private

  def pay_latter?
    if params['sale']['pay_latter'] == "1"
      PayLatter.new(name: params['sale']['name'], phone: params['sale']['phone'],
                    price: params['sale']['invoicing'], date: params['sale']['date']).save
      redirect_to pay_latters_path, notice: "Conta a receber criada com sucesso!"
    end
  end

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:sale).permit(:date, :invoicing, :pay_latter, :name, :phone, :collaborator_id, :for_collaborator,
                                 product_solds_attributes: %i(id product quantity _destroy))
  end
end

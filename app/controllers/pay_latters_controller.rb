class PayLattersController < ApplicationController
  include Controllers::Crudify
  model_klass PayLatter

  before_action :check_registration_path, only: %i(index new)

  def paid_out
    pay_latter = PayLatter.find_by(id: params['id'])

    if pay_latter.collaborator.present?
      Sale.new(date: Date.current, invoicing: pay_latter.price,
               collaborator_id: pay_latter.collaborator, for_collaborator: true,
               payment_method_id: pay_latter.payment_method_id).save
    else
      Sale.new(date: Date.current, invoicing: pay_latter.price,
               payment_method_id: pay_latter.payment_method_id).save
    end
    pay_latter.delete
    redirect_to sales_url, notice: 'Registrado com sucesso!'
  end

  private

  def check_registration_path
    if PaymentMethod.count > 0
      unless Collaborator.count > 0
        redirect_to new_collaborator_path, notice: 'Cadastre um Ponto de Venda primeiro!'
      end
    else
      redirect_to new_payment_method_path, notice: 'Cadastre um Método de Pagamento primeiro!'
    end
  end

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:pay_latter).permit(:name, :phone, :price, :date, :collaborator,
                                       :for_collaborator, :payment_method_id)
  end
end

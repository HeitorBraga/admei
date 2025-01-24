class PayLattersController < ApplicationController
  include Controllers::Crudify
  model_klass PayLatter

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

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:pay_latter).permit(:name, :phone, :price, :date, :collaborator,
                                       :for_collaborator, :payment_method_id)
  end
end

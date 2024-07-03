class PayLattersController < ApplicationController
  include Controllers::Crudify
  model_klass PayLatter

  def paid_out
    pay_latter = PayLatter.find_by(id: params['id'])

    Sale.new(date: Date.current, invoicing: pay_latter.price).save
    pay_latter.delete
    redirect_to sales_url, notice: 'Registrado com sucesso!'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:pay_latter).permit(:name, :phone, :price, :date)
  end
end

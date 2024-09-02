class CashRegistersController < ApplicationController
  include Controllers::Crudify
  model_klass CashRegister

  def create
    CashRegister.new(
      amount: params['cash_register']['amount'],
      payment_method_id: params['cash_register']['payment_method_id'],
      month: params['cash_register']['month'],
      add_money: params['cash_register']['add_money']
    ).save

    if params['wallet'] == "true"
      redirect_to root_url, notice: "Adicionado com Sucesso!"
    else
      redirect_to cash_registers_url, notice: "Criado com Sucesso!"
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:cash_register).permit(:amount, :payment_method_id, :month, :add_money)
  end
end

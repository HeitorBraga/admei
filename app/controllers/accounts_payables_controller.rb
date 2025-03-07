class AccountsPayablesController < ApplicationController
  include Controllers::Crudify
  model_klass AccountsPayable

  before_action :check_permissions

  def account_paid
    account = AccountsPayable.find_by(id: params['id'])

    Spending.new(
      origin: 'Pagamento ' + account.name,
      date: Date.current,
      price: account.price,
      payment_method_id: PaymentMethod.first.id
    ).save

    account.delete
    redirect_to accounts_payables_url, notice: 'Registrado com Sucesso!'
  end

  private

  def check_permissions
    permission = Permission.find_by(user_id: current_user.id)
    unless permission.pay_latters_and_accounts_payables == true
      redirect_to root_url, notice: 'Você não tem permissão!'
    end
  end

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:accounts_payable).permit(:name, :date, :price)
  end
end

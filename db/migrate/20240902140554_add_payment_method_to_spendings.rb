class AddPaymentMethodToSpendings < ActiveRecord::Migration[6.1]
  def change
    add_reference :spendings, :payment_method, foreign_key: true
  end
end

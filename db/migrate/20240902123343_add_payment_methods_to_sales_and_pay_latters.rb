class AddPaymentMethodsToSalesAndPayLatters < ActiveRecord::Migration[6.1]
  def change
    add_reference :sales, :payment_method, foreign_key: true
    add_reference :pay_latters, :payment_method, foreign_key: true
  end
end

class PaymentMethod < ApplicationRecord
  has_many :cash_registers, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :pay_latters, dependent: :destroy
end

class PaymentMethod < ApplicationRecord
  has_many :cash_registers, dependent: :destroy
end

FactoryBot.define do
  factory :cash_register do
    amount { 1.5 }
    payment_method { nil }
    month { 1 }
  end
end

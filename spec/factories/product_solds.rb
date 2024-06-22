FactoryBot.define do
  factory :product_sold do
    sale { nil }
    product { 1 }
    quantity { 1 }
  end
end

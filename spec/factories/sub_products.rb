FactoryBot.define do
  factory :sub_product do
    name { "MyString" }
    quantity { 1 }
    price { 1.5 }
    spending { nil }
  end
end

FactoryBot.define do
  factory :cost do
    ingredient { "MyString" }
    unit { 1 }
    quantity { 1 }
    price { 1.5 }
    quantity_used { 1 }
    cost { 1.5 }
  end
end

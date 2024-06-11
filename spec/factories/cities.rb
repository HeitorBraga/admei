FactoryBot.define do
  factory :city do
    name { Faker::Address.city }
    ibge_code { Faker::Number.number(digits: 7) }
    state
  end
end

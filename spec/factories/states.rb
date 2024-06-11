FactoryBot.define do
  factory :state do
    name { Faker::Address.state }
    ibge_code { Faker::Number.number(digits: 5) }
    uf { Faker::Address.state_abbr }
    country
  end
end

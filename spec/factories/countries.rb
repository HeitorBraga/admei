FactoryBot.define do
  factory :country do
    name { Faker::Address.country }
    iso_code { Faker::Address.country_code }
    ibge_code { Faker::Number.number(digits: 4) }
  end
end

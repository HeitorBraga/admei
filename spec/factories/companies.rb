FactoryBot.define do
  factory :company do
    trade_name { Faker::Company.name }
    legal_name { Faker::Company.name }
    federal_tax_id { Faker::Company.brazilian_company_number(formatted: true) }
    state_tax_id { "ISENTO" }
  end
end

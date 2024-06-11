FactoryBot.define do
  factory :address do
    address { Faker::Address.street_name }
    number { Faker::Address.building_number }
    district { Faker::Address.community }
    zip { "#{Faker::Number.number(digits: 5)}-#{Faker::Number.number(digits: 3)}" }
    addressable { |a| a.association(:company) }
    city
  end
end

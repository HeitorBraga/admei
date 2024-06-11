FactoryBot.define do
  factory :backoffice_contract, class: 'Backoffice::Contract' do
    trader { nil }
    users { 1 }
    terminals { 1 }
    price { "9.99" }
    extras { "9.99" }
    extra_description { "MyText" }
  end
end

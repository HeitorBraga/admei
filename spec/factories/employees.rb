FactoryBot.define do
  factory :employee do
    name { "MyString" }
    phone { "MyString" }
    company_position { nil }
    wage { 1.5 }
  end
end

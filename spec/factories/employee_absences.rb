FactoryBot.define do
  factory :employee_absence do
    employee { nil }
    date { "2024-09-11" }
    reason { "MyString" }
  end
end

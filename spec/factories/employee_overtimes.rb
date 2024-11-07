FactoryBot.define do
  factory :employee_overtime do
    employee { nil }
    date { "2024-09-11" }
    hours { 1 }
  end
end

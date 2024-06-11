FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2020-09-03 13:42:57" }
  end
end

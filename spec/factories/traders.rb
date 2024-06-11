FactoryBot.define do
  factory :trader do
    name { Faker::TvShows::Simpsons.character }
    person_type { :natural }
    federal_tax_id { "#{rand(10**5).to_s[0,3]}.#{rand(10**5).to_s[0,3]}.#{rand(10**5).to_s[0,3]}-#{rand(10**5).to_s[0,2]}" }
    gender { ['M', 'F', 'O'].sample(1).first }
    phone { '(62) 99172-4016' }
    mobile { '(62) 99172-4016' }
    email { Faker::Internet.email }
    birth_date { Faker::Date.birthday }
  end
end

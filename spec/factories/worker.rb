FactoryBot.define do
  factory :worker do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birth_date { Faker::Date.birthday(min_age: 16, max_age: 65) }
    hire_date { Faker::Date.between(from: 25.years.ago, to: Time.zone.today) }
    matricule { Faker::Number.unique.number(digits: 5) }
  end
end

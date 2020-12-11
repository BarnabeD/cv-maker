FactoryBot.define do
  factory :worker do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    hire_date { Faker::Date.between(from: 25.years.ago, to: Time.zone.today) }
    matricule { Faker::Number.unique.number(digits: 5) }

    trait :is_twenty_five_years_old do
      birth_date { Date.today - 25.years }
    end

    trait :is_minor do
      birth_date { Date.today - 17.years }
    end

    trait :is_graduated do
      after :create do |worker|
        create_list :graduate, 5, worker: worker
      end
    end

    trait :five_years_old_graduated do
      is_graduated
      after :create do |worker|
        create_list :graduate, 1, :five_years_old, worker: worker
      end
    end
  end
end

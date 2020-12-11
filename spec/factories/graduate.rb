FactoryBot.define do
  factory :graduate do
    name { Faker::Lorem.sentence(word_count: 3) }
    speciality { Faker::IndustrySegments.sub_sector }
    school_name { Faker::University.name }
    school_department { '69' }
    graduation_date { Faker::Date.birthday(min_age: 1, max_age: 40) }
    worker

    trait :five_years_old do
      graduation_date { Date.today - 5.years}
    end
  end
end

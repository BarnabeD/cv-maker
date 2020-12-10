FactoryBot.define do
  factory :graduate do
    name { Faker::Job.education_level }
    speciality { Faker::IndustrySegments.sub_sector }
    school_name { Faker::University.name }
    school_department { '69' }
    graduation_date { Faker::Date.birthday(min_age: 1, max_age: 40) }
    worker
  end
end

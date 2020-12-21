FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123456' }
    password_confirmation { '123456' }
    confirmed_at { Time.now }

    trait :admin do
      admin { true }
    end
  end
end

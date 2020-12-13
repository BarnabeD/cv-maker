FactoryBot.define do
  factory :user do
    email { 'admin@terideal.fr' }
    password { '123456' }
    password_confirmation { '123456' }
    admin { true }
    confirmed_at { Time.now }
  end
end

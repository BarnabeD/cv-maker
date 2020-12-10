FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    city { Faker::Address.city }
  end
end

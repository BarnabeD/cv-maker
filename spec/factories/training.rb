FactoryBot.define do
  factory :training do
    name { Faker::Lorem.sentence(word_count: 3) }
    date { Faker::Date.birthday(min_age: 16, max_age: 65) }
    training_type { 'Sécurité' }
    worker
  end
end

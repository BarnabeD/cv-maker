FactoryBot.define do
  factory :position do
    position_name { Faker::Lorem.sentence(word_count: 3) }
    worker
    site
    company
  end
end

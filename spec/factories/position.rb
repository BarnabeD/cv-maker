FactoryBot.define do
  factory :position do
    position_name { Faker::Lorem.sentence(word_count: 5) }
    association :worker, :skip_validate
    site
    company
  end
end

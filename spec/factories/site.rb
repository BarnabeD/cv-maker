FactoryBot.define do
  factory :site do
    name { Faker::Lorem.sentence(word_count: 3) }
    site_type { site_type.sample }
    start_date { Faker::Date.between(from: 5.years.ago, to: Date.today) }
    end_date { Faker::Date.between(from: 4.years.ago, to: Date.today) }
    amount { Faker::Number.between(from: 1, to: 100) }
    money_unit { 'K€' }
    confidence { 'confident' }
    client
  end
end

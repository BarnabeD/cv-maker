FactoryBot.define do
  factory :site do
    name { Faker::Lorem.sentence(word_count: 3) }
    site_type { ['Marché unique', 'Marché à bon de commande', 'Accord cadre'].sample }
    start_date { 5.years.ago }
    end_date { 4.years.ago }
    amount { Faker::Number.between(from: 1, to: 100) }
    money_unit { 'K€' }
    client

    trait :is_confident do
      confidence { 'confident' }
    end

    trait :is_not_sure do
      confidence { 'not sure' }
    end

    trait :is_not_confident do
      confidence { 'not confident' }
    end

    trait :two_months_duration do
      start_date { 6.months.ago }
      end_date { 4.months.ago }
    end

    trait :two_years_and_three_month_duration do
      start_date { 6.years.ago }
      end_date { 4.years.ago + 3.months + 1.days }
    end
  end
end

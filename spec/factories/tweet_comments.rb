FactoryBot.define do
  factory :tweet_comment do
    association :member
    association :tweet
    comment { Faker::Lorem.characters(number: 100) }
  end
end
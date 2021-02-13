FactoryBot.define do
  factory :tweet do
    title { Faker::Lorem.characters(number: 5) }
    content { Faker::Lorem.characters(number: 20) }
    image { File.open("#{Rails.root}/app/assets/images/test.jpg") }
    member
  end
end

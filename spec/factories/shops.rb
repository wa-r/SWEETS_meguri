FactoryBot.define do
  factory :shop do
    name { Faker::Lorem.characters(10) }
    phone_number { '03-1234-5678' }
    address { '東京都新宿区1-1-1' }
    nearest_station { 'JR新宿駅 徒歩10分' }
    business_hours { '10:00〜19:00' }
    regular_holiday { 毎週金曜日 }
    main_image { fixture_file_upload('app/assets/images/test.jpg') }
    caption { Faler::Lorem.characters(150) }
    genre { '1' }
    shop_images
  end
end
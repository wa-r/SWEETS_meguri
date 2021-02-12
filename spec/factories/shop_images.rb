FactoryBot.define do
  factory :shop_image do
    image { File.open("#{Rails.root}/app/assets/images/test.jpg") }
    shop
  end
end
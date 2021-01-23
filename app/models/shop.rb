class Shop < ApplicationRecord
  attachment :shop_image

  belongs_to :genre

  validates :name, presence: true, length: { in: 2..30 }
  validates :address, presence: true
  validates :nearest_station, presence: true
  validates :business_hours, presence: true
  validates :regular_holiday, presence: true
  validates :shop_image, presence: true
  validates :caption, presence: true, length: { maximum: 300 }
end

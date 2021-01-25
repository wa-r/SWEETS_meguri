class Shop < ApplicationRecord
  belongs_to :genre
  has_many :shop_images, dependent: :destroy

  attachment :main_image
  accepts_attachments_for :shop_images, attachment: :image

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, presence: true, length: { in: 2..30 }
  validates :address, presence: true
  validates :nearest_station, presence: true
  validates :business_hours, presence: true
  validates :regular_holiday, presence: true
  validates :caption, presence: true, length: { maximum: 300 }
  validates :phone_number, presence: true
end
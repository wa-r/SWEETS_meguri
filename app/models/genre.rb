class Genre < ApplicationRecord
  has_many :shops
  validates :name, presence: true, length: { maximum: 10 }
end

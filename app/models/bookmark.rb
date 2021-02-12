class Bookmark < ApplicationRecord
  belongs_to :member
  belongs_to :shop
end

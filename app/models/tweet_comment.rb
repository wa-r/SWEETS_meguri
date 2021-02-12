class TweetComment < ApplicationRecord
  belongs_to :member
  belongs_to :tweet
  has_many :notifications, dependent: :destroy
  
  validates :comment, presence: true
end
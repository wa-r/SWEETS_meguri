class TweetComment < ApplicationRecord
  belongs_to :member
  belongs_to :tweet

  validates :comment, presence: true
end

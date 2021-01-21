class TweetLike < ApplicationRecord
  belongs_to :member
  belongs_to :tweet
end

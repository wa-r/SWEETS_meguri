class Notification < ApplicationRecord
  belongs_to :tweet, optional: true
  belongs_to :tweet_comment, optional: true
  belongs_to :visitor, class_name: "Member", foreign_key: "visitor_id", optional: true
  belongs_to :visited, class_name: "Member", foreign_key: "visited_id", optional: true
end

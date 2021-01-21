class Tweet < ApplicationRecord
  attachment :image

  belongs_to :member
  has_many :tweet_likes

  # ユーザーがつぶやきをお気に入りしているかどうかの判定メソッド
  def tweet_liked_by?(member)
    tweet_likes.where(member_id: member.id).exists?
  end

end

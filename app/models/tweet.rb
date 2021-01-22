class Tweet < ApplicationRecord
  attachment :image

  belongs_to :member
  has_many :tweet_likes, dependent: :destroy
  has_many :tweet_comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 150 }

  # ユーザーがつぶやきをお気に入りしているかどうかの判定メソッド
  def tweet_liked_by?(member)
    tweet_likes.where(member_id: member.id).exists?
  end

end

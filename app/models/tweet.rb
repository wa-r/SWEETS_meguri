class Tweet < ApplicationRecord
  attachment :image

  belongs_to :member
  has_many :tweet_likes, dependent: :destroy
  has_many :tweet_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :title, presence: true, length: { maximum: 15 }
  validates :content, presence: true, length: { maximum: 150 }
  validates :image, presence: true

  # ユーザーがつぶやきをお気に入りしているかどうかの判定メソッド
  def tweet_liked_by?(member)
    tweet_likes.where(member_id: member.id).exists?
  end
  
  # いいねの通知の定義
  def create_notification_like!(current_member)
    # すでに「いいね」されているか検索
    like_check = Notification.where(["visitor_id = ? and visited_id = ? and tweet_id = ? and action = ? ", current_member.id, member_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if like_check.blank?
      notification = current_member.active_notifications.new(
        tweet_id: id,
        visited_id: member_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.is_checked = true
      end
      notification.save if notification.valid?
    end
  end
end

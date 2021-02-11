class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  # 自分がフォローしているユーザーとの関係
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  # 自分がフォローされているユーザーとの関係
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  has_many :tweets, dependent: :destroy
  has_many :tweet_likes, dependent: :destroy
  has_many :likes, through: :tweet_likes, source: :tweet
  has_many :tweet_comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :shop_bookmarks, through: :bookmarks, source: :shop
  # 自分からの通知
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  # 相手からの通知
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  validates :name, presence: true, length: { in: 2..10 }
  validates :introduction, length: { maximum: 100 }

  # ゲストユーザー情報を予め作る手間と、アカウントが削除されて動作しなくなるリスクを防いでいる
  def self.guest
    find_or_create_by!(name: "ゲスト", email: "guestt@example.com") do |member|
      member.password = SecureRandom.urlsafe_base64
    end
  end

  # 退会済み(is_deleted == true)のユーザーを弾くためのメソッド
  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  # フォローする際に、すでにフォロー済みかどうかを判定する
  def followed_by?(member)
    passive_relationships.find_by(following_id: member.id).present?
  end

  # フォローの通知の定義
  def create_notification_follow!(current_member)
    follow_check = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ", current_member.id, id, 'follow'])
    if follow_check.blank?
      notification = current_member.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end


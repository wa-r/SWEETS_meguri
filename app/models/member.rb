class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image
  validates :name, presence: true, length: { in: 2..20 }
  
  # 退会済み(is_deleted == true)のユーザーを弾くためのメソッド
  # is_deletedがfalseならtrueを返すようにしてい
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
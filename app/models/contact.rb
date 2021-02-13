class Contact < ApplicationRecord
  validates :name, presence: true, length: { in: 2..10 }
  validates :title, presence: true
  validates :email, presence: true
  validates :message, presence: true
end

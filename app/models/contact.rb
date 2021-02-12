class Contact < ApplicationRecord
  validates :name, presence: true
  validates :title, presence: true
  validates :email, presence: true
  validates :message, presence: true
end

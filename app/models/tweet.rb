class Tweet < ApplicationRecord
  attachment :image
  
  belongs_to :member
  
end

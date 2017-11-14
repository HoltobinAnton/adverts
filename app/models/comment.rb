class Comment < ApplicationRecord
  validates :description, presence: true
  validates_length_of :description, maximum: 300
  
  belongs_to :user
  belongs_to :advert
end

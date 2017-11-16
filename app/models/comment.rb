class Comment < ApplicationRecord
  validates :description, presence: true
  validates_length_of :description, maximum: 300

  belongs_to :user
  belongs_to :advert
  
  has_one :picture, as: :imageable
  #accepts_nested_attributes_for :images
end

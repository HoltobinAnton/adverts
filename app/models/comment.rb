class Comment < ApplicationRecord
  validates :description, presence: true
  validates_length_of :description, maximum: 300
  mount_uploader :avatar, AvatarUploader
  
  belongs_to :user
  belongs_to :advert
  
  has_one :picture, as: :imageable
  #accepts_nested_attributes_for :images
end

class Advert < ApplicationRecord
  validates :description, presence: true
  validates_length_of :description, maximum: 160

  belongs_to :user
  has_one :picture, as: :imageable
  #accepts_nested_attributes_for :picture
end

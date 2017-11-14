class Advert < ApplicationRecord
  validates :desctiption, presence: true
  validates_length_of :desctiption, maximum: 160

  belongs_to :user
end

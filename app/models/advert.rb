class Advert < ApplicationRecord
  validates :description, presence: true
  validates_length_of :description, maximum: 160

  belongs_to :user
end

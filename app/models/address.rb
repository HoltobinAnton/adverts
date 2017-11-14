class Address < ApplicationRecord
  validates :city, :address, :state, :country, :zip, presence: true
  validates :zip, numericality: { greater_than: 3,
                                  less_than_or_equal_to: 10 }
  belongs_to :user
end

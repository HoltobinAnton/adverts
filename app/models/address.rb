class Address < ApplicationRecord
  validates :city, :address, :state, :country, :zip, presence: true
  validates :zip, numericality: { greater_than: 3 }
  validates_length_of :city, :address, :state, :country, maximum: 25
  
  belongs_to :user

end

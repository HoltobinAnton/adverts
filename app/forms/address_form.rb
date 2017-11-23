class AddressForm < Rectify::Form
  attribute :address, String
  attribute :city, String
  attribute :country, String
  attribute :state, String
  attribute :zip, Integer
  attribute :user_id, Integer
  
  validates :address, :city, :state, :country, :zip, :user_id, presence: true
  validates_length_of :address, :city, :state, :country, maximum: 25
  validates :zip, numericality: { greater_than: 3 }
end
class PersonalForm < Rectify::Form
  attribute :login, String
  attribute :full_name, String
  attribute :email, String
  attribute :birthday, Date
  attribute :role_id, Integer
  attribute :password, String
  attribute :password_confirmation, String
  
  validates :login, :full_name, :email, :birthday, :role_id, presence: true
  validates :password, :password_confirmation, presence: true
  validates_length_of :login, :password, :password_confirmation, maximum: 20
  validates_length_of :full_name, maximum: 30
end
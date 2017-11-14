class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :login, :full_name, :birthday, presence: true
  validates_length_of :login, maximum: 20
  validates_length_of :full_name, maximum: 30
  has_many :comments
  has_many :adverts
  has_one :address
  belongs_to :role

end

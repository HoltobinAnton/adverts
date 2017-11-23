class Advert < ApplicationRecord
  include PgSearch
  validates :description, presence: true
  validates_length_of :description, maximum: 160
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  has_many :comments
  has_one :picture, as: :imageable
  accepts_nested_attributes_for :picture

  pg_search_scope :search, against: :description,
    associated_against: { user: :full_name, comments: :description }



end

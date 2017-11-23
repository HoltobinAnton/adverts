class User < ApplicationRecord
  DEF_ADDRESS = { city: 'Kyiv', country: 'Ukraine', state: 'Ukraine',
                  address: 'Ukraine', zip: '01000' }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  validates :login, :full_name, :birthday, presence: true
  validates_length_of :login, maximum: 20
  validates_length_of :full_name, maximum: 30
  has_many :comments
  has_many :adverts
  has_one :address
  belongs_to :role

  before_create :set_default_role

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email.nil? ? "#{auth.info.last_name}@mail.com" : auth.info.email
      user.login = auth.extra.raw_info.name
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.extra.raw_info.name
      user.birthday = Date.strptime(auth.extra.raw_info.birthday, '%m/%d/%Y')
      user.role_id = Role.find_by_name('user').id
      address = Address.create(pust_address(auth))
      user.address = address
    end
  end

  private

  def self.pust_address(auth)
    address = auth.extra.raw_info.location.name.split(',')
    address.nil? ? DEF_ADDRESS : { city: address.first, country: address.second,
                                   state: 'Ukraine', address: 'Ukraine',
                                   zip: '01000' }
  end

  def set_default_role
    self.role = Role.find_by_name('user')
  end
  
end

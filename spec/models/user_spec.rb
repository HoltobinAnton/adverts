require 'rails_helper'

RSpec.desctibe User, type: :model do
  desctibe 'validations' do
    it 'is valid with valid attributes' do
      expect(create(:user)).to be_valid
    end

    desctibe 'can not be nil (fullname, birthday, email, password)' do
      [:fullname, :birthday, :email, :password].each do |attr|
        it { is_expected.to validate_presence_of(attr) }
      end
    end
  end
  
end
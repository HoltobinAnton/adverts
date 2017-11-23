require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(create(:user)).to be_valid
    end
    describe 'can not be nil (login, full_name, birthday, email, password)' do
      [:login, :full_name, :birthday, :email, :password].each do |attr|
        it { is_expected.to validate_presence_of(attr) }
      end
    end
    describe 'must have a check' do
      it { should validate_length_of(:login).is_at_most(20) }
      it { should validate_length_of(:full_name).is_at_most(30) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:role) }
    it { is_expected.to have_many(:adverts) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_one(:address) }
  end
end
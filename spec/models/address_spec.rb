require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(create(:address)).to be_valid
    end
    describe 'can not be nil (login, full_name, birthday, email, password)' do
      [:city, :address, :state, :country, :zip].each do |attr|
        it { is_expected.to validate_presence_of(attr) }
      end
    end
    describe 'must have a check' do
      [:city, :address, :state, :country].each do |attr|
        it { should validate_length_of(attr).is_at_most(25) }
      end
      it 'validate_numericality_of :quantity' do
        should validate_numericality_of(:zip).is_greater_than(3)
      end
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end

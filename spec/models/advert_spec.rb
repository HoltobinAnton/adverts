require 'rails_helper'

RSpec.describe Advert, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(create(:advert)).to be_valid
    end
    it { is_expected.to validate_presence_of(:description) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(create(:comment)).to be_valid
    end
    it { is_expected.to validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_most(300) }
  end
  
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:advert) }
  end
end

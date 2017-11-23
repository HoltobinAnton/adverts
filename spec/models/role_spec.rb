require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(create(:role)).to be_valid
    end
    it { is_expected.to validate_presence_of(:name) }
  end
  
  describe 'associations' do
    it { is_expected.to have_many(:users) }
  end

end

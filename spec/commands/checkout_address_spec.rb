require 'rails_helper'

RSpec.describe CheckoutAddress do
  before do
    FactoryBot.create(:user)
  end
  
  describe 'method #call' do
    it 'should return the valid broadcast' do
      subject = CheckoutAddress.new(address_params)
      expect { subject.call }.to broadcast(:valid)
    end
    it 'should return the invalid broadcast' do
      subject = CheckoutAddress.new({address: {}})
      expect { subject.call }.to broadcast(:invalid)
    end
  end
end
require 'rails_helper'

RSpec.describe CheckoutAddress do
  
  describe 'method #call' do
    it 'should return the valid broadcast' do
      subject = CheckoutPersonal.new(personal_params)
      expect { subject.call }.to broadcast(:valid)
    end
    it 'should return the invalid broadcast' do
      subject = CheckoutPersonal.new(missing_params)
      expect { subject.call }.to broadcast(:invalid)
    end
  end
end
require 'rails_helper'

RSpec.describe Ability, type: :model do
  subject(:ability) { Ability.new(guest) }
  let(:guest) { User.new }

  context 'should have_abilities' do
    it { should be_able_to(:read, User) }
    it { should be_able_to(:read, Comment) }
    it { should be_able_to(:read, Advert) }
  end

  context 'should not have ability' do
    it { should_not be_able_to(:manage, User) }
    it { should_not be_able_to(:manage, Comment) }
    it { should_not be_able_to(:manage, Advert) }
  end

  context 'User has rights when he is authorized' do
    user = FactoryBot.create(:user)
    other_user = FactoryBot.create(:user)
    ability = Ability.new(user)
    it do
        ability.can?(:manage, Advert.new(user: user)).should be true
        ability.can?(:manage, Advert.new(user: other_user)).should be false
        ability.can?(:manage, Comment.new(user: user)).should be true
        ability.can?(:manage, Comment.new(user: other_user)).should be false
        ability.can?(:manage, user).should be true
        ability.can?(:manage, other_user).should be false
      end
  end

  context 'Moderator' do
    role_moder = FactoryBot.create(:role, name: 'moderator')
    moder = FactoryBot.create(:user)
    moder.role_id = role_moder.id
    other_user = FactoryBot.create(:user)
    ability = Ability.new(moder)
    it do
        ability.can?(:manage, Advert.new(user: moder)).should be true
        ability.can?(:manage, Advert.new(user: other_user)).should be true
        ability.can?(:manage, Comment.new(user: moder)).should be true
        ability.can?(:manage, Comment.new(user: other_user)).should be true
        ability.can?(:manage, moder).should be true
        ability.can?(:manage, other_user).should be false
      end
  end

  context 'Admin' do
    role_admin = FactoryBot.create(:role, name: 'admin')
    admin = FactoryBot.create(:user)
    admin.role_id = role_admin.id
    ability = Ability.new(admin)
    it do
      ability.can?(:manage, :all).should be true
    end
  end
end
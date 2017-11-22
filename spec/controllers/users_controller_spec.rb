require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }
  before do
    allow_any_instance_of(CanCan::ControllerResource).
      to receive(:load_and_authorize_resource) { nil }
  end

  describe 'GET #index' do
    before do
      get :show_users
    end
     it "assigns @adverts" do
      user_first = FactoryBot.create(:user)
      user_second = FactoryBot.create(:user)
      expect(assigns(:users)).to eq([user_first, user_second])
    end
    it "renders the index template" do
      expect(response).to render_template(:show_users)
    end
  end

  describe 'GET #look_at' do
    it "renders the look_at template" do
      user = FactoryBot.create(:user)
      get :look_at, params: { format: user.id }
      expect(response).to render_template(:look_at)
    end
  end

  describe 'GET #show' do
    it 'personal step' do
      get :show, params: { id: :personal }
      expect(response).to render_template :personal
    end
    it 'address step' do
      get :show, params: { id: :address }
      expect(response).to render_template :address
    end
  end

  describe 'PUT #update' do
    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user)
          .and_return(user)
      params = { user: { login: 'newLog', email: 'new@gmail.con' } }
      patch :update, params: params
    end

    it 'should be show the flash message' do
        expect(flash.now[:success]).to_not be_nil
    end
    it 'should return root_path after update' do
      expect(response).to redirect_to(root_path)
    end
  end
end

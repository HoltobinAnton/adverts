require 'rails_helper'

RSpec.describe AdvertsController, type: :controller do
  let(:user) { create :user }
  before do
    allow_any_instance_of(CanCan::ControllerResource).
      to receive(:load_and_authorize_resource) { nil }
  end

  describe 'GET #index' do
    before do
      get :index
    end
     it "assigns @adverts" do
      advert_first = FactoryBot.create(:advert)
      advert_second = FactoryBot.create(:advert)
      expect(assigns(:items)).to eq([advert_first, advert_second])
    end
    it "renders the index template" do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it "renders the show template" do
      advert = FactoryBot.create(:advert)
      get :show, params: { id: advert.id } 
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it "renders the new template" do
      get :new 
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    it "renders the new templat" do
      advert = FactoryBot.create(:advert)
      get :edit, params: { id: advert.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    before do
      post :create,  params: valid_advert
    end
    it { is_expected.to respond_with 302 }
    it { is_expected.to respond_with_content_type :html }
    it 'should increment by 1' do
      expect { post :create, params: valid_advert }.
        to change { Advert.count }.by(1)
    end
  end

  describe 'DELETE #destroy' do
    before { @advert = FactoryBot.create(:advert) }
    let(:params) { delete :destroy, params: { id: @advert.id } }
    context 'delete an item' do
      subject { params }
      it 'should delete one item' do
        expect { subject }.to change { Advert.count }.by(-1)
      end
    end
    context 'check status' do
      before do
        params
      end
      it 'should redirect_to adverts path' do
        expect(response).to redirect_to(adverts_path)
      end
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to respond_with 302 }
    end
  end


end

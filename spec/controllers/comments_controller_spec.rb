require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:advert) { create :advert }
  let(:user) { advert.user }
  let(:params) { valid_comment }
  before do
    sign_in user
    allow_any_instance_of(CanCan::ControllerResource).
      to receive(:load_and_authorize_resource) { nil }
  end

  describe 'POST #create' do
    context 'valid params' do
      before do
        post :create, format: :js,  params: valid_comment
      end
      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :js }
      it 'should not be redirect comment' do
        expect(response).to_not be_redirect
      end
      it 'should increment by 1' do
        expect { post :create, format: :js,  params: valid_comment }.
          to change { Comment.count }.by(1)
      end
    end
    context 'invalid params' do
      before do
        post :create, format: :html, params: invalid_comment
      end
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to respond_with 302 }
      it 'should not be redirect comment' do
        expect(response).to redirect_to(root_path)
      end
      it 'should not increment by 1' do
        expect { post :create, params: invalid_comment }.
          to_not change { Comment.count }
      end
    end
  end
  
  describe 'DELETE #destroy' do
    before { @comment = FactoryBot.create(:comment) }
    let(:params) { delete :destroy, format: :js, params: { id: @comment.id } }
    context 'delete an item' do
      subject { params }
      it 'should delete one item' do
        expect { subject }.to change { Comment.count }.by(-1)
      end
    end
    context 'check status' do
      before do
        params
      end
      it { is_expected.to render_template :destroy }
      it { is_expected.to respond_with_content_type :js }
      it { is_expected.to respond_with :ok }
    end
  end

  describe 'PUT #update' do
    before do
      comment = FactoryBot.create(:comment) 
      params = { id: comment.id,
        comment: { advert_id: comment.advert.id,
         user_id: comment.user.id, description: "test" } }
      patch :update, params: params
    end
    it 'should return root_path after update' do
      expect(response).to redirect_to(root_path)
    end
    it 'should display norice message' do
      expect(flash[:notice]).to be_present
    end
    it { is_expected.to respond_with_content_type :html }
  end

  describe 'GET #show' do
    let(:comment) { create :comment }
    before do
      get :edit, params: { id: comment.id }
    end
    it 'assigns comment' do
      expect(assigns(:comment)).to eq(comment)
    end
    it { is_expected.to render_template :edit }
    it { is_expected.to respond_with :ok }
    it { is_expected.to render_with_layout :application }
    it { is_expected.to respond_with_content_type :html }
  end

end

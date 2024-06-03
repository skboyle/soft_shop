require 'rails_helper'

RSpec.describe BundlesController, type: :controller do
  let(:admin_user) { create(:user, admin: true) }
  let(:bundle) { create(:bundle) }

  before { sign_in admin_user }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: bundle.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new Bundle" do
      expect {
        post :create, params: { bundle: attributes_for(:bundle) }
      }.to change(Bundle, :count).by(1)
    end
  end

  describe "PATCH #update" do
    it "updates the bundle" do
      patch :update, params: { id: bundle.id, bundle: { discount_amount: 10.0 } }
      bundle.reload
      expect(bundle.discount_amount).to eq(10.0)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested bundle" do
      bundle = create(:bundle)
      expect {
        delete :destroy, params: { id: bundle.id }
      }.to change(Bundle, :count).by(-1)
    end
  end
end

require 'rails_helper'

RSpec.describe BillingAddressesController, type: :controller do
  let(:user) { create(:user) }
  let(:order) { create(:order, user: user) }
  let(:billing_address) { create(:billing_address, user: user) }
  let(:valid_attributes) { attributes_for(:billing_address, order_id: order.id) }

    before do
        sign_in user
    end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: billing_address.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new BillingAddress" do
      expect {
        post :create, params: { billing_address: valid_attributes }
      }.to change(BillingAddress, :count).by(1)
    end
  end

  describe "PATCH #update" do
    it "updates the billing_address" do
      patch :update, params: { id: billing_address.id, billing_address: { first_name: "NewName" } }
      billing_address.reload
      expect(billing_address.first_name).to eq("NewName")
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested billing_address" do
      billing_address = create(:billing_address, user: user)
      expect {
        delete :destroy, params: { id: billing_address.id }
      }.to change(BillingAddress, :count).by(-1)
    end
  end
end

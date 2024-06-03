require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:user) { create(:user) }
  let(:order) { create(:order, user: user) }

  before { sign_in user }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: order.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new Order" do
      expect {
        post :create, params: { order: attributes_for(:order) }
      }.to change(Order, :count).by(1)
    end
  end

  describe "PATCH #update" do
    it "updates the order" do
      patch :update, params: { id: order.id, order: { refunded: true } }
      order.reload
      expect(order.refunded).to be true
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested order" do
      order = create(:order, user: user)
      expect {
        delete :destroy, params: { id: order.id }
      }.to change(Order, :count).by(-1)
    end
  end
end

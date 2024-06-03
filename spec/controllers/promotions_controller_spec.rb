# spec/controllers/promotions_controller_spec.rb
require 'rails_helper'

RSpec.describe PromotionsController, type: :controller do
  let(:admin_user) { create(:user, admin: true) }
  let(:promotion) { create(:promotion) }

  before { sign_in admin_user }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: promotion.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new Promotion" do
      expect {
        post :create, params: { promotion: attributes_for(:promotion) }
      }.to change(Promotion, :count).by(1)
    end
  end

  describe "PATCH #update" do
    it "updates the promotion" do
      patch :update, params: { id: promotion.id, promotion: { discount_amount: 20.0 } }
      promotion.reload
      expect(promotion.discount_amount).to eq(20.0)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested promotion" do
      promotion = create(:promotion)
      expect {
        delete :destroy, params: { id: promotion.id }
      }.to change(Promotion, :count).by(-1)
    end
  end
end

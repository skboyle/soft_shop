require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let(:user) { create(:user) }
  let(:cart) { create(:cart, user: user) }
  let(:product) { create(:product) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    it "creates a new Cart" do
      expect {
        post :create, params: { cart: { user_id: user.id } }
      }.to change(Cart, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe "POST #add_product" do
    it "adds a product to the cart" do
      expect {
        post :add_product, params: { id: cart.id, product_id: product.id }
      }.to change(cart.products, :count).by(1)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE #remove_product" do
    before { cart.products << product }
    
    it "removes a product from the cart" do
      expect {
        delete :remove_product, params: { id: cart.id, product_id: product.id }
      }.to change(cart.products, :count).by(-1)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE #clear" do
    before { cart.products << product }

    it "clears all products from the cart" do
      expect {
        delete :clear, params: { id: cart.id }
      }.to change(cart.products, :count).to(0)
      expect(response).to have_http_status(:ok)
    end
  end
end

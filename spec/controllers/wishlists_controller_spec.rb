require 'rails_helper'

RSpec.describe WishlistsController, type: :controller do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:wishlist) { create(:wishlist, user: user) }

  before { sign_in user }

  describe "GET #index" do
    it "returns the user's wishlist" do
      get :index
      expect(response).to be_successful
      expect(assigns(:wishlist)).to eq(user.wishlist)
    end
  end

  describe "POST #create" do
    it "creates a new Wishlist" do
      expect {
        post :create, params: { wishlist: attributes_for(:wishlist) }
      }.to change(Wishlist, :count).by(1)
    end
  end

  describe "PATCH #update" do
    it "updates the wishlist" do
      patch :update, params: { id: wishlist.id, wishlist: { product_ids: [product.id] } }
      wishlist.reload
      expect(wishlist.products).to include(product)
    end
  end
end

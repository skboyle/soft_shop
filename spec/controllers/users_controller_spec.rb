require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:admin_user) { create(:user, :admin) }

  before do
    sign_in admin_user  # Assuming you are using Devise for authentication
  end

  describe "GET #index" do
    before { get :index }

    it "returns a success response" do
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    before { get :show, params: { id: user.id } }

    it "returns a success response" do
      expect(response).to be_successful
    end
  end

  describe "PATCH #update" do
    before do
      patch :update, params: { id: user.id, user: { email: "newemail@example.com" } }
    end

    it "updates the user" do
      user.reload
      expect(user.email).to eq("newemail@example.com")
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user_to_destroy = create(:user)
      expect {
        delete :destroy, params: { id: user_to_destroy.id }
      }.to change(User, :count).by(-1)
    end
  end
end

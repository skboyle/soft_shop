require 'rails_helper'

RSpec.describe ManufacturersController, type: :controller do
  let(:admin_user) { create(:user, admin: true) }
  let(:manufacturer) { create(:manufacturer) }

  before { sign_in admin_user }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: manufacturer.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new Manufacturer" do
      expect {
        post :create, params: { manufacturer: attributes_for(:manufacturer) }
      }.to change(Manufacturer, :count).by(1)
    end
  end

  describe "PATCH #update" do
    it "updates the manufacturer" do
      patch :update, params: { id: manufacturer.id, manufacturer: { contact_name: "NewContact" } }
      manufacturer.reload
      expect(manufacturer.contact_name).to eq("NewContact")
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested manufacturer" do
      manufacturer = create(:manufacturer)
      expect {
        delete :destroy, params: { id: manufacturer.id }
      }.to change(Manufacturer, :count).by(-1)
    end
  end
end

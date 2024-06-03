require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:admin_user) { create(:user, admin: true) }
  let(:user) { create(:user) }
  let(:manufacturer) { create(:manufacturer) } # Ensure manufacturer is created
  let(:product) { create(:product, manufacturer: manufacturer) } # Associate product with the manufacturer

  let(:valid_attributes) do
    {
      title: "Sample Product",
      category: "Software",
      featured: false,
      product_code: "SP123",
      description: "This is a sample product description.",
      specifications: "Sample specifications",
      operating_system: "Windows",
      price: 99.99,
      cost: 49.99,
      msrp: 109.99,
      manufacturer_id: manufacturer.id # Use the manufacturer's ID
    }
  end

  before do
    sign_in admin_user
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: product.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
  context "with valid parameters" do
    let(:manufacturer) { create(:manufacturer) } # Create a valid manufacturer
    let(:valid_attributes) { attributes_for(:product, manufacturer_id: manufacturer.id) } # Include manufacturer_id in valid attributes
    
    it "creates a new product associated with the correct manufacturer" do
      post :create, params: { product: valid_attributes }
      
      expect(response).to have_http_status(:success)
      expect {
        post :create, params: { product: valid_attributes }
      }.to change(Product, :count).by(1)
      
      # Check if the manufacturer is associated with the newly created product
      expect(Product.last.manufacturer).to eq(manufacturer)
    end
  end
end


  describe "PATCH #update" do
    it "updates the product" do
      patch :update, params: { id: product.id, product: { title: "NewTitle" } }
      product.reload
      expect(product.title).to eq("NewTitle")
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      product = create(:product)
      expect {
        delete :destroy, params: { id: product.id }
      }.to change(Product, :count).by(-1)
    end
  end
end

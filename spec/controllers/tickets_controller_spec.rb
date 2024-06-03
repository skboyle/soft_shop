# spec/controllers/tickets_controller_spec.rb
require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let(:user) { create(:user) }
  let(:order) { create(:order, user: user) }
  let(:ticket) { create(:ticket, order: order) }

  before { sign_in user }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: { order_id: order.id }
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { order_id: order.id, id: ticket.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new Ticket" do
      expect {
        post :create, params: { order_id: order.id, ticket: attributes_for(:ticket) }
      }.to change(Ticket, :count).by(1)
    end
  end

  describe "PATCH #update" do
    it "updates the ticket" do
      patch :update, params: { order_id: order.id, id: ticket.id, ticket: { status: "Resolved" } }
      ticket.reload
      expect(ticket.status).to eq("Resolved")
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested ticket" do
      ticket = create(:ticket, order: order)
      expect {
        delete :destroy, params: { order_id: order.id, id: ticket.id }
      }.to change(Ticket, :count).by(-1)
    end
  end
end

# spec/controllers/messages_controller_spec.rb
require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:order) { create(:order, user: user) }
  let(:ticket) { create(:ticket, order: order) }
  let(:message) { create(:message, ticket: ticket) }

  before { sign_in user }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: { ticket_id: ticket.id }
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { ticket_id: ticket.id, id: message.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new Message" do
      expect {
        post :create, params: { ticket_id: ticket.id, message: attributes_for(:message) }
      }.to change(Message, :count).by(1)
    end
  end

  describe "PATCH #update" do
    it "updates the message" do
      patch :update, params: { ticket_id: ticket.id, id: message.id, message: { content: "NewContent" } }
      message.reload
      expect(message.content).to eq("NewContent")
    end
  end
end

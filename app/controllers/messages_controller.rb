class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :update, :destroy]
    before_action :authenticate_user!
  
    def index
      @messages = Ticket.find(params[:ticket_id]).messages
      render json: @messages
    end
  
    def show
      render json: @message
    end
  
    def create
      @message = Ticket.find(params[:ticket_id]).messages.build(message_params)
      if @message.save
        render json: @message, status: :created
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @message.update(message_params)
        render json: @message
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_message
      @message = Message.find(params[:id])
    end
  
    def message_params
      params.require(:message).permit(:content)
    end
  end
  
class TicketsController < ApplicationController
    before_action :set_ticket, only: [:show, :update, :destroy]
    before_action :authenticate_user!
  
    def index
      @tickets = current_user.orders.find(params[:order_id]).tickets
      render json: @tickets
    end
  
    def show
      render json: @ticket
    end
  
    def create
      @ticket = current_user.orders.find(params[:order_id]).tickets.build(ticket_params)
      if @ticket.save
        render json: @ticket, status: :created
      else
        render json: @ticket.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @ticket.update(ticket_params)
        render json: @ticket
      else
        render json: @ticket.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @ticket.destroy
      head :no_content
    end
  
    private
  
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
  
    def ticket_params
      params.require(:ticket).permit(:status, :awaiting_response, :notes, :resolution)
    end
  end
  
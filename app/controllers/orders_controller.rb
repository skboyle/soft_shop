class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :update, :destroy]
    before_action :authenticate_user!
  
    def index
      @orders = current_user.orders
      render json: @orders
    end
  
    def show
      render json: @order
    end
  
    def create
      @order = current_user.orders.build(order_params)
      if @order.save
        render json: @order, status: :created
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @order.update(order_params)
        render json: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @order.destroy
      head :no_content
    end
  
    private
  
    def set_order
      @order = current_user.orders.find(params[:id])
    end
  
    def order_params
      params.require(:order).permit(:order_number, :refunded)
    end
  end
  
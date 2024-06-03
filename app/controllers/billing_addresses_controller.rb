class BillingAddressesController < ApplicationController
    before_action :set_billing_address, only: [:show, :update, :destroy]
    before_action :authenticate_user!
  
    def index
      @billing_addresses = BillingAddress.all
      render json: @billing_addresses
    end
  
    def show
      render json: @billing_address
    end
  
    def create
        @billing_address = current_user.billing_addresses.new(billing_address_params)
    
        if @billing_address.save
          redirect_to @billing_address, notice: 'Billing address was successfully created.'
        else
          render :new
        end
      end
    
  
    def update
      if @billing_address.update(billing_address_params)
        render json: @billing_address
      else
        render json: @billing_address.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @billing_address.destroy
      head :no_content
    end
  
    private
  
    def set_billing_address
      @billing_address = BillingAddress.find(params[:id])
    end
  
    def billing_address_params
      params.require(:billing_address).permit(:first_name, :last_name, :address_line_one, :address_line_two, :state, :zip_code, :country, :order_id)
    end
  end
  
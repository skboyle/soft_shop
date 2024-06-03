class ManufacturersController < ApplicationController
    before_action :set_manufacturer, only: [:show, :update, :destroy]
    before_action :authenticate_user!
    before_action :authorize_admin!, only: [:create, :update, :destroy]
  
    def index
      @manufacturers = Manufacturer.all
      render json: @manufacturers
    end
  
    def show
      render json: @manufacturer
    end
  
    def create
      @manufacturer = Manufacturer.new(manufacturer_params)
      if @manufacturer.save
        render json: @manufacturer, status: :created
      else
        render json: @manufacturer.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @manufacturer.update(manufacturer_params)
        render json: @manufacturer
      else
        render json: @manufacturer.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @manufacturer.destroy
      head :no_content
    end
  
    private
  
    def set_manufacturer
      @manufacturer = Manufacturer.find(params[:id])
    end
  
    def manufacturer_params
      params.require(:manufacturer).permit(:endpoint, :contact_name, :contact_email)
    end
  
    def authorize_admin!
      render json: { error: 'Not Authorized' }, status: :unauthorized unless current_user.admin?
    end
  end
  
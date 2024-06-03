class SoftwareKeysController < ApplicationController
    before_action :set_software_key, only: [:show, :update, :destroy]
    before_action :authenticate_user!
  
    def index
      @software_keys = current_user.software_keys
      render json: @software_keys
    end
  
    def show
      render json: @software_key
    end
  
    def create
      @software_key = current_user.software_keys.build(software_key_params)
      if @software_key.save
        render json: @software_key, status: :created
      else
        render json: @software_key.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @software_key.update(software_key_params)
        render json: @software_key
      else
        render json: @software_key.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @software_key.destroy
      head :no_content
    end
  
    private
  
    def set_software_key
      @software_key = SoftwareKey.find(params[:id])
    end
  
    def software_key_params
      params.require(:software_key).permit(:key)
    end
  end
  
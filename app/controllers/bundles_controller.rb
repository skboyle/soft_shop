class BundlesController < ApplicationController
    before_action :set_bundle, only: [:show, :update, :destroy]
    before_action :authenticate_user!
    before_action :authorize_admin!, only: [:create, :update, :destroy]
  
    def index
      @bundles = Bundle.all
      render json: @bundles
    end
  
    def show
      render json: @bundle
    end
  
    def create
      @bundle = Bundle.new(bundle_params)
      if @bundle.save
        render json: @bundle, status: :created
      else
        render json: @bundle.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @bundle.update(bundle_params)
        render json: @bundle
      else
        render json: @bundle.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @bundle.destroy
      head :no_content
    end
  
    private
  
    def set_bundle
      @bundle = Bundle.find(params[:id])
    end
  
    def bundle_params
      params.require(:bundle).permit(:discount_amount, product_ids: [])
    end
  
    def authorize_admin!
      render json: { error: 'Not Authorized' }, status: :unauthorized unless current_user.admin?
    end
  end
  
class PromotionsController < ApplicationController
    before_action :set_promotion, only: [:show, :update, :destroy]
    before_action :authenticate_user!
    before_action :authorize_admin!, only: [:create, :update, :destroy]
  
    def index
      @promotions = Promotion.all
      render json: @promotions
    end
  
    def show
      render json: @promotion
    end
  
    def create
      @promotion = Promotion.new(promotion_params)
      if @promotion.save
        render json: @promotion, status: :created
      else
        render json: @promotion.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @promotion.update(promotion_params)
        render json: @promotion
      else
        render json: @promotion.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @promotion.destroy
      head :no_content
    end
  
    private
  
    def set_promotion
      @promotion = Promotion.find(params[:id])
    end
  
    def promotion_params
      params.require(:promotion).permit(:start_date, :end_date, :discount_amount)
    end
  
    def authorize_admin!
      render json: { error: 'Not Authorized' }, status: :unauthorized unless current_user.admin?
    end
  end
  
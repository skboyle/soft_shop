class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    before_action :authorize_admin!, only: [:create, :update, :destroy]
  
    def index
      @products = Product.all
      render json: @products
    end
  
    def show
      render json: @product
    end
  
    def create
        @product = Product.new(product_params)
    
        if @product.save
          render json: @product, status: :created
        else
            render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
        end
      end
  
    def update
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end
  

    def destroy
        if current_user.admin?
          @product = Product.find(params[:id])
    
          if @product.destroy
          else
          end
        else
        end
      end
  
    def category
      @products = Product.where(category: params[:category])
      render json: @products
    end
  
    def manufacturer
      @products = Product.where(manufacturer_id: params[:manufacturer_id])
      render json: @products
    end
  
    private
  
    def set_product
      @product = Product.find(params[:id])
    end
  
    def product_params
      params.require(:product).permit(:title, :manufacturer_id, :category, :featured, :product_code, :description, :specifications, :operating_system, :price, :cost, :msrp)
    end
  
    def authorize_admin!
      render json: { error: 'Not Authorized' }, status: :unauthorized unless current_user.admin?
    end
  end
  
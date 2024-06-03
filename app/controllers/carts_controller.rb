class CartsController < ApplicationController
    before_action :set_cart, only: [:show, :update, :destroy, :add_product, :remove_product, :clear]
  
    def index
      @carts = Cart.all
      render json: @carts
    end
  
    def create
      @cart = Cart.new(cart_params)
      if @cart.save
        render json: @cart, status: :created
      else
        render json: @cart.errors, status: :unprocessable_entity
      end
    end
  
    def add_product
      product = Product.find(params[:product_id])
      if @cart.products << product
        render json: @cart.products, status: :ok
      else
        render json: @cart.errors, status: :unprocessable_entity
      end
    end
  
    def remove_product
      product = Product.find(params[:product_id])
      if @cart.products.delete(product)
        render json: @cart.products, status: :ok
      else
        render json: @cart.errors, status: :unprocessable_entity
      end
    end
  
    def clear
      if @cart.products.clear
        render json: { message: 'Cart cleared successfully' }, status: :ok
      else
        render json: @cart.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_cart
      @cart = Cart.find(params[:id])
    end
  
    def cart_params
      params.require(:cart).permit(:user_id)
    end
  end
  
class WishlistsController < ApplicationController
    before_action :authenticate_user!
    
    # GET /wishlists
    def index
      @wishlist = current_user.wishlist
      render json: @wishlist
    end
    
    # POST /wishlists
    def create
      @wishlist = current_user.create_wishlist
      if @wishlist.save
        render json: @wishlist, status: :created
      else
        render json: @wishlist.errors, status: :unprocessable_entity
      end
    end
    
    # GET /wishlists/products
    def products
      @wishlist = current_user.wishlist
      @products = @wishlist.products
      render json: @products
    end
    
    # PATCH/PUT /wishlists/1
    def update
      @wishlist = current_user.wishlist
      if @wishlist.update(wishlist_params)
        render json: @wishlist
      else
        render json: @wishlist.errors, status: :unprocessable_entity
      end
    end
    
    private
    
    def wishlist_params
      params.require(:wishlist).permit(product_ids: [])
    end
  end
  
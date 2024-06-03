Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show, :update, :destroy] do
    resource :cart, only: [:show, :update, :destroy]
    resource :wishlist, only: [:show, :update, :destroy]
    resources :orders, only: [:index, :show, :create, :update, :destroy]
    resource :billing_address, only: [:show, :create, :update, :destroy]
    resource :shipping_address, only: [:show, :create, :update, :destroy]
    resources :software_keys, only: [:index, :show, :create, :update, :destroy]
  end

  resources :billing_addresses, only: [:index, :show, :create, :update, :destroy]
  resources :shipping_addresses, only: [:index, :show, :create, :update, :destroy]
  
  resources :products, only: [:index, :show, :create, :update, :destroy] do
    collection do
      get 'category/:category', to: 'products#category', as: 'category'
      get 'manufacturer/:manufacturer_id', to: 'products#manufacturer', as: 'manufacturer'
    end
  end

  resources :manufacturers, only: [:index, :show, :create, :update, :destroy]
  
  resources :orders, only: [:index, :show, :create, :update, :destroy] do
    resources :tickets, only: [:index, :show, :create, :update, :destroy]
    resource :billing_address, only: [:show, :create, :update, :destroy]
    resource :shipping_address, only: [:show, :create, :update, :destroy]
    resources :software_keys, only: [:index, :show, :create, :update, :destroy]
  end

  resources :carts, only: [:index, :create] do
    member do
      post :add_product
      delete :remove_product
      delete :clear
    end
  end

  resources :wishlists, only: [:index, :create, :update] do
    get 'products', on: :collection
  end
  resources :promotions, only: [:index, :show, :create, :update, :destroy]
  resources :bundles, only: [:index, :show, :create, :update, :destroy]
  resources :tickets, only: [:index, :show, :create, :update, :destroy] do
    resources :messages, only: [:index, :show, :create, :update, :destroy]
  end
  resources :messages, only: [:index, :show, :create, :update, :destroy]
  resources :software_keys, only: [:index, :show, :create, :update, :destroy]
end

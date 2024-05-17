Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'orders/index'
  get 'orders/show'
  get 'cart_products/index'
  get 'cart_products/show'
  get 'carts/index'
  get 'user_cart_products/index'
  get 'user_carts/index'
  get 'carts/index'
  get 'products/index'
    devise_for :users, :controllers => {
      :registrations => "users/registrations",sessions: 'users/sessions'}
      # devise_for :users, controllers: { sessions: 'users/sessions' }
      devise_scope :user do
        get '/users/sign_out' => 'devise/sessions#destroy'
      end
    
      patch '/cart_products/:id', to: 'cart_products#update', as: 'update_cart_product'
      
      resource :cart, only: [:show, :update, :get]
      resources :cart_products, only: [:create, :update, :destroy]
      root 'products#index'
       resources :products, only: [:new, :create, :show]

        resources :shops
         resources :products
         resources :carts, only: [:show, :update] do
          resources :cart_products, only: [:update, :destroy]
        end
        resources :carts do
          member do
            patch 'update_quantity'
          end
        end
        resources :orders, only: [:new, :create, :show]
        resources :cart_products, only: [:destroy, :update]
        resources :carts, only: [:show, :update]
        resources :orders, only: [:new, :create, :show]
        resources :orders, only: [:index, :create]
      
end

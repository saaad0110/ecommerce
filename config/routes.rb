Rails.application.routes.draw do
  get 'user_carts/index'
  get 'carts/index'
  get 'products/index'
    devise_for :users, :controllers => {
      :registrations => "users/registrations",sessions: 'users/sessions'}
      # devise_for :users, controllers: { sessions: 'users/sessions' }
      resource :user_cart, only: [:show] do
        post 'add_to_cart/:product_id', action: :add_to_cart, on: :member, as: :add_to_cart
      end
      root 'products#index'

        resources :shops
         resources :products


end

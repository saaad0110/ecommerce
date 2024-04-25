Rails.application.routes.draw do
  get 'cart_products/index'
  get 'cart_products/show'
  get 'carts/index'
  get 'carts/show'
  get 'user_cart_products/index'
  get 'user_carts/index'
  get 'carts/index'
  get 'products/index'
    devise_for :users, :controllers => {
      :registrations => "users/registrations",sessions: 'users/sessions'}
      # devise_for :users, controllers: { sessions: 'users/sessions' }
     
 
      
      resource :cart, only: [:show]
      resources :cart_products, only: [:create, :update, :destroy]
      root 'products#index'
       resources :products, only: [:new, :create, :show]

        resources :shops
         resources :products

end

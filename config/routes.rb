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
     
      patch '/cart_products/:id', to: 'cart_products#update', as: 'update_cart_product'
      
      resource :cart, only: [:show, :update]
      resources :cart_products, only: [:create, :update, :destroy]
      root 'products#index'
       resources :products, only: [:new, :create, :show]

        resources :shops
         resources :products

end

Rails.application.routes.draw do
  get 'products/index'
    devise_for :users, :controllers => {
      :registrations => "users/registrations",sessions: 'users/sessions'}
      # devise_for :users, controllers: { sessions: 'users/sessions' }

      root 'homes#index'

        resources :shops
         resources :products


end

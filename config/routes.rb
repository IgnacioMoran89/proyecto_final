Rails.application.routes.draw do

  resources :order_items
  resources :reviews
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :payments
  resources :categories
  resources :products
  resources :checkouts
  resources :orders
  resource :cart, only: [:show, :update, :create] do 
    member do
      post :pay_with_paypal
      get :process_paypal_payment
    end
  end 

  resources :shop_profiles do
    resources :reviews, except: [:show, :index]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

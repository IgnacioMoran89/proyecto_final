Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :payments
  resources :categories
  resources :products
  resources :checkouts
  resources :orders
  resources :shop_profiles
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

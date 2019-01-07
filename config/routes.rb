Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :line_items
  resources :carts
  resources :instruments
  devise_for :users, controllers:{
  	registration: 'registrations',
  	confirmations: 'confirmations',
    omniauth_callbacks: 'users/omniauth'
  }
  root 'instruments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

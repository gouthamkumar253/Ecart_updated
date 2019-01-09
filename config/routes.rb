Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :line_items
  resources :carts
  resources :instruments
  resources :comments
  resources :charges #:only [ :new , :create]
  devise_for :users, controllers:{
  	registration: 'registrations',
  	confirmations: 'confirmations',
    omniauth_callbacks: 'users/omniauth'
  }
  root 'instruments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

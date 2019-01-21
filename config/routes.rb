Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ActionCable.server => '/cable'
  resources :line_items
  resources :carts
  resources :instruments
  resources :comments
  resources :charges #:only [ :new , :create]
  devise_for :users ,controllers:{
  	registration: 'registrations',
  	confirmations: 'confirmations',
    omniauth_callbacks: 'users/omniauth'
  } 
   
  resources :messages, only:[:create]
  resources :chat_rooms, only: [:new, :create, :show, :index]
  get '/instruments_user', to: 'instruments#show_user_instruments', as: 'show_user_instruments'

 
  root 'instruments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  root "games#index"
  resources :games

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  
  # Routes for omniauth login
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end

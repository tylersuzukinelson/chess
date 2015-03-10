Rails.application.routes.draw do

  root "games#index"
  resources :games

  resources :boards, only: [] do
    resources :game_pieces, only: [] do
      get '/get_move_set', to: 'game_pieces#get_move_set'
    end
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  
  # Routes for omniauth login
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end

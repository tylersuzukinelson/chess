Rails.application.routes.draw do
  root "games#index"
  resources :games

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

end

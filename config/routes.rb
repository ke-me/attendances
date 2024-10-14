Rails.application.routes.draw do
  # get 'sessions/new'
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'users/complete', to: 'users#complete'
  get 'signup', to: 'users#new'
  resources :users, only: [:create, :show, :edit, :update, :destroy]

end

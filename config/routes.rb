Rails.application.routes.draw do
  get 'static_pages/home'
  # get 'sessions/new'
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

  root "static_pages#home"
  

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'users/complete', to: 'users#complete'
  get 'signup', to: 'users#new'
  resources :users, only: [:create, :show, :edit, :update, :destroy]

  # get 'works/index'
  # get 'works/create'
  # get 'works/update'
  resources :works, only: [:index, :create, :update]
end

Rails.application.routes.draw do
  resources :adopcions
  devise_for :users
  #root 'main#home'
  root "application#home"

  resources :cuidadores, only: [:show,:index, :new, :create]
  resources :paseadores, only: [:index,:show,:new, :create, :edit, :update]

  get 'main/home', to: 'main#home'


  # Defines the root path route ("/")
  get '/home', to: 'application#home'
  get '/homeAdopcion', to: 'application#homeAdopcion'
  get '/homeCampana', to: 'application#homeCampana'


end

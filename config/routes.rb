Rails.application.routes.draw do
  devise_for :users
  #root 'main#home'
  root "application#home"

  resources :cuidadores, only: [:show,:index, :new, :create]
  resources :paseadores, only: [:index,:show,:new, :create, :edit, :update]
  resources :perdidos, only:  [:show,:index, :new, :create]
  
  get 'main/home', to: 'main#home'
  resources :encontrados, only:  [:show,:index, :new, :create]

  # Defines the root path route ("/")
  get '/home', to: 'application#home'
  get '/homeAdopcion', to: 'application#homeAdopcion'
  get '/homeCampana', to: 'application#homeCampana'

  
end

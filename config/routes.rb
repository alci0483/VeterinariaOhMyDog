Rails.application.routes.draw do
  devise_for :users

  #root 'main#home'
  root "application#home"

  resources :cuidadores, only: [:show,:index, :new, :create]
  resources :paseadores, only: [:index,:show,:new, :create, :edit, :update]
  resources :paseadores do
    member do
      get 'contactar', to: 'paseadores#contactar'
      post 'enviar_contacto', to: 'paseadores#enviar_contacto'
   end
  end
  resources :cuidadores do
    member do
      get 'contactar', to: 'cuidadores#contactar'
      post 'enviar_contacto', to: 'cuidadores#enviar_contacto'
   end
  end


  get 'main/home', to: 'main#home'

  resources :adopcions
  resources :campanas

  # Defines the root path route ("/")
  get '/home', to: 'application#home'


end

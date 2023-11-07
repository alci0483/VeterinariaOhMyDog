Rails.application.routes.draw do
  devise_for :users, controllers: {
   sessions: 'users/sessions'
  }

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


  # Defines the root path route ("/")
  get '/home', to: 'application#home'
  get '/homeAdopcion', to: 'application#homeAdopcion'
  get '/homeCampana', to: 'application#homeCampana'


end

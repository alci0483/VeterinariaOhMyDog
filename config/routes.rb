Rails.application.routes.draw do
  devise_for :users
  # config/routes.rb
  # config/routes.rb
  # config/routes.rb
  # config/routes.rb
  # config/routes.rb
  # config/routes.rb
  # config/routes.rb
  # config/routes.rb
devise_for :admins, controllers: {
  registrations: 'admin/registrations'
}

resources :admin, only: [:index] do
  # Otras rutas específicas para administrar usuarios
  get 'new_user_registration', on: :collection
  post 'create_user', on: :collection
end








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
  resources :perdidos, only:  [:show,:index, :new, :create]

  get 'main/home', to: 'main#home'
  resources :encontrados, only:  [:show,:index, :new, :create]
  # Defines the root path route ("/")
  get '/home', to: 'application#home'


end

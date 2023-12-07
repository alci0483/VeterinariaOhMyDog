Rails.application.routes.draw do

  resources :turno_nuevo, only: [:new, :create]

  # config/routes.rb
   resources :mensajes, only: [:index]

   resources :turno_generado, only: [:new, :create]

   # config/routes.rb
   resources :generador_motivo, only: [:edit, :update]


   post 'turnos/:id/insistir', to: 'turnos#inasistir', as: 'inasistir_turno'
   post 'adopcions/:id/adoptar', to: 'adopcions#adoptar', as: 'adoptar_adopcion'
   post 'perdidos/:id/encontrar', to: 'perdidos#encontrar', as: 'encontrar_perdido'

   #get 'agregar_descripcion', to: 'turno_generado#agregar_descripcion'
   #post 'crear_descripcion', to: 'turno_generado#crear_descripcion'
   resources :perros do
  get 'generar_turno', on: :member
   end
  resources :turnos, only: [:index, :new, :create, :show]
  resources :consulta_generals
  resources :desparasitacions
  resources :castracions
  resources :vacunacions
  resources :perros, only: [:index, :show, :new, :create, :edit, :update, :destroy]
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

resources :usuarios, only: [:index, :show]

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
  resources :turnos, only: [:index, :new, :create]
  delete 'turnos/:id', to: 'turnos#destroy', as: 'destroy_turno'
  post 'turnos/:id/cancelar', to: 'turnos#cancelar', as: 'cancelar_turno'
  post 'turnos/:id/confirmar', to: 'turnos#confirmar', as: 'confirmar_turno'
  post 'turnos/:id/rechazar', to: 'turnos#rechazar', as: 'rechazar_turno'

  get 'main/home', to: 'main#home'
resources :encontrados, only: [:show, :index, :new, :create, :edit, :update]
  # Defines the root path route ("/")
  get '/home', to: 'application#home'


end

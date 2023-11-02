Rails.application.routes.draw do
  devise_for :users
  root 'main#home'

  resources :cuidadores, only: [:show,:index, :new, :create]
  resources :paseadores, only: [:index,:show,:new, :create, :edit, :update]




  # Defines the root path route ("/")
    get '/home', to: 'application#home'
    get '/homeAdopcion', to: 'application#homeAdopcion'
    get '/homeCampana', to: 'application#homeCampana'

  # root "articles#index"
  #root "application#home"

end

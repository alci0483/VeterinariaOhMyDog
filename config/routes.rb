Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
    get '/home', to: 'application#home'
    get '/homeAdopcion', to: 'application#homeAdopcion'
    get '/homeCampana', to: 'application#homeCampana'

  # root "articles#index"
  root "application#home"
end

Rails.application.routes.draw do
  post '/perdidos', to: 'perdidos#create'
  get '/perdidos/new', to: 'perdidos#new', as: :new_perdido
  get '/perdidos', to: 'perdidos#index'
  get '/perdidos/:id', to: 'perdidos#show', as: :perdido
end

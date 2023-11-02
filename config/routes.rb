Rails.application.routes.draw do
  devise_for :users
  root 'main#home'

  resources :cuidadores, only: [:show,:index, :new, :create]
  resources :paseadores, only: [:index,:show,:new, :create, :edit, :update]




end

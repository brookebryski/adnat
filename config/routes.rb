Rails.application.routes.draw do

  get '/' => 'sessions#home'
  get '/welcome' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  get '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  resources :users
  resources :organisations
  resources :shifts
end

Rails.application.routes.draw do

  root 'static_pages#home'

  resources :users, except: [:new]
  resources :sessions, only: [:create]

  get '/signup',      to: 'users#new'
  get '/signin',      to: 'sessions#new'
  delete '/signout',  to: 'sessions#destroy'
  get '/articles',    to: 'articles#index'


end

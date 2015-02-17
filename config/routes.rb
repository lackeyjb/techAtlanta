Rails.application.routes.draw do

  root 'users#new'

  resources :users, except: [:new]
  resources :sessions, only: [:create]

  # get '/signup',      to: 'users#new'
  get '/signin',      to: 'sessions#new'
  delete '/signout',  to: 'sessions#destroy'
  get '/articles',    to: 'articles#index'

end

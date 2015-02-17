Rails.application.routes.draw do

  root 'static_pages#home'

  resources :users, except: [:new]

  get '/signup',   to: 'users#new'
  get '/signin',   to: 'users#sessionsnew'
  get '/articles', to: 'articles#index'


end

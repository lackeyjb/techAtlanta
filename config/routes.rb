Rails.application.routes.draw do

  root 'users#new'

  resources :users, except: [:new]
  resources :sessions, only: [:create, :destroy]
  resources :articles
  resources :favorites, except: [:edit]

  get '/about',         to: 'static_pages#about'
  get '/signin',        to: 'sessions#new'
  delete '/signout',    to: 'sessions#destroy'
end

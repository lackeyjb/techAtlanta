Rails.application.routes.draw do

  root 'static_pages#home'

  get 'articles', to: 'articles#index'
end

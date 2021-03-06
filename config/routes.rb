Rails.application.routes.draw do
  resources :dailies
  get 'dailies/index'
  get 'tasks/index'
  get 'tasks/new'
  patch 'tasks/start'
  patch 'tasks/finished'

  resources :tasks

  root'users#index'
  resources :users
  post'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login',to:'sessions#new'
  post '/login',to:'sessions#create'
  delete '/logout',to:'sessions#destroy'
end

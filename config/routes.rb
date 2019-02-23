Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/new'
  resources :tasks

  get 'sessions/new'

  root'users#index'
  resources :users
  post'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login',to:'sessions#new'
  post '/login',to:'sessions#create'
  delete '/logout',to:'sessions#destroy'
end

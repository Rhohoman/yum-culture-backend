Rails.application.routes.draw do
  resources :foods
  resources :favorites
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/edit_username', to: 'users#update_username'

  # post '/create', to: 'user#create'

  get '/profile', to: 'users#profile'
  # get '/users/:id', to 'users#show'
  post '/login', to: 'auth#login'
end

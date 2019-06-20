Rails.application.routes.draw do
  resources :posts
  resources :foods
  resources :favorites
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/edit_username', to: 'users#update_username'

  # post '/create', to: 'user#create'

  get '/profile', to: 'users#profile'
  # get '/users/:id', to 'users#show'
  post '/login', to: 'auth#login'

  get '/largest_hash_key', to: 'favorites#largest_hash_key'

  post '/posts/:id', to: 'posts#update'
  post '/users/:id', to: 'users#update'
end

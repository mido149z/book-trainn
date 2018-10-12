Rails.application.routes.draw do
	
  get 'sessions/new'
  get 'users/new'

  get '/users',  to: 'users#index'
  get '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root 'users#landing_page'
  resources :users
end

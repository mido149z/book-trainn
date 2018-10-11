Rails.application.routes.draw do
	
  get 'users/new'

  get '/users',  to: 'users#index'
  get '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  #root 'application#index'
  resources :users
end

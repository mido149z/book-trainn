Rails.application.routes.draw do

	# url books
	get '/books/new',  to: 'books#new'
	post '/books/new',  to: 'books#new'
	patch '/books/new',  to: 'books#edit'

	get '/books/:id',  to: 'books#view'

	get '/books/:id/edit',  to: 'books#edit'
	post '/books/:id/edit',  to: 'books#edit'
	patch '/books/:id/edit',  to: 'books#edit'

	delete '/books/delete/:id',  to: 'books#delete'
	delete '/books/drop',  to: 'books#drop'

  	get 'books', to: 'books#index'

	get '/users',  to: 'users#index'
	get '/signup',  to: 'users#new'
	post '/signup',  to: 'users#create'

	get    '/login',   to: 'sessions#new'
	post   '/login',   to: 'sessions#create'
	delete '/logout',  to: 'sessions#destroy'

	root 'users#landing_page'
	resources :users
end

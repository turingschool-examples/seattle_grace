Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	# hospitals
	get '/hospitals', to: 'hospitals#index'
	get '/hospitals/new', to: 'hospitals#new'
	post '/hospitals', to: 'hospitals#create'
	get '/hospitals/:id', to: 'hospitals#show'
	get '/hospitals/:id/edit', to: 'hospitals#edit'
	patch '/hospitals/:id', to: 'hospitals#update'
	delete '/hospitals/:id', to: 'hospitals#destroy'

	# doctors
	get '/hospitals/:id/doctors', to: 'doctors#index'
	get '/hospitals/:id/doctors/new', to: 'docotors#new'
	post '/hospitals/:id/doctors', to: 'doctors#create'
	get '/hospitals/:id/doctors/:id', to: 'doctors#show'
	get '/hospitals/:id/doctors/:id/edit', to: 'doctors#edit'
	patch '/hospitals/:id/doctors/:id', to: 'doctors#update'
	delete '/hospitals/:id/doctors/:id', to: 'doctors#destroy'

end

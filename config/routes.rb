Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors, only: [:show]
  resources :patients, only: [:index]
  resources :hospitals, only: [:show]
  delete '/doctors/:id/patients/:id', to: 'patient_doctors#destroy'
end

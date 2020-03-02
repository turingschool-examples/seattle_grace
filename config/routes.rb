Rails.application.routes.draw do
  resources :doctors, only: [:show]
  resources :patients, only: [:index, :destroy]
  resources :hospitals, only: [:show]
  delete '/doctors/:doctor_id/patients/:id', to: 'doctor_patients#destroy'
end

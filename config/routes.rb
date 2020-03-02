Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors, only: [:show]
  patch "/doctors/:doctor_id/:patient_id/edit", to: "doctors#update"

  resources :patients, only: [:index]
  resources :hospitals, only: [:show]
end

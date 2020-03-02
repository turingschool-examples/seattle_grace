Rails.application.routes.draw do
  resources :doctors, only: [:show]
  resources :patients, only: [:index]
  resources :hospitals, only: [:show]

  patch "/doctors/:doctor_id/patients/:patient_id", to: "doctors#remove_patient"
end

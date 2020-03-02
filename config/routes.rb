Rails.application.routes.draw do
  get '/doctors/:doctor_id', to: 'doctors#show'
  get '/patients', to: 'patients#index'
  get '/hospitals/:hospital_id', to: 'hospitals#show'
  delete '/doctor_patient/:doctor_id/:patient_id', to: 'doctor_patients#destroy'
end

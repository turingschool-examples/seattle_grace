Rails.application.routes.draw do
  get '/doctors/:doctor_id', to: 'doctors#show'
  get '/patients', to: 'patients#index'
  get '/hospitals/:hospital_id', to: 'hospitals#show'
end

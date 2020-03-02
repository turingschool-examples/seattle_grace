Rails.application.routes.draw do

  get "/doctors/:id", to: "doctors#show"

  get '/patients', to: "patients#index"

  delete "/patients/:id", to: "doctor_patients#destroy"

  get '/hospitals/:id', to: "hospitals#show"
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/doctors/:doctor_id', to: "doctors#show"

  get '/patients', to: "patients#index"

  get '/hospitals/:hospital_id', to: "hospitals#index"
end

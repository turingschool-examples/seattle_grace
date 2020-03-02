Rails.application.routes.draw do

  get "/doctors/:id", to: "doctors#show"

  get '/patients', to: "patients#index"
end

Rails.application.routes.draw do
  get "doctors/:doctor_id", to: "doctors#show"
  get "hospitals/:hospital_id", to: "hospitals#show"
  delete "doctors/:doctor_id/:patient_id", to: "doctors#destroy"
end

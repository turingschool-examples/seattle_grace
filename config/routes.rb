Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


	get "doctors/:id", to: "doctors#show"

	get "patients", to: "patients#index"

	get "hospitals/:id", to: "hospitals#show"

	delete "doctors/:doc_id/patients/:id", to: "doctor_patients#destroy"
end

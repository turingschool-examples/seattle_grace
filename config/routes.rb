Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	# Hospitals
	get '/hospitals/:id', to: 'hospitals#show'

	# Doctors
	get '/hospitals/:holspital_id/doctors/:doctor_id', to: 'doctors#show'
	delete '/hospitals/:holspital_id/doctors/:doctor_id/patients/:patient_id', to: 'patient_status#destroy'
	# Patients
	get '/patients', to: 'patients#index'
end

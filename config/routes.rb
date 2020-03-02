Rails.application.routes.draw do
  get 'doctors/:doctor_id', to: 'doctors#show'

  get "/doctors/:doctor_id/patients/:patient_id", to: "doctor_patients#destroy"


  get 'hospitals/:hospital_id', to: 'hospitals#show'

  get "/patients/index", to: 'patients#index'

end

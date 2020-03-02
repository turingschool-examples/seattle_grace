class DoctorPatientsController < ApplicationController

  def destroy
    doctor_patient_relationship = DoctorPatient.find_by(patient_id: params[:patient_id])
    doctor_patient_relationship.destroy
    redirect_back(fallback_location: '/doctors/id')
  end
end

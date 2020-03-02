class DoctorPatientsController < ApplicationController
  def destroy
    doc_patient = DoctorPatient.find_by(patient_id: params[:id], doctor_id: params[:doctor_id])
    DoctorPatient.destroy(doc_patient.id)
    redirect_back(fallback_location: '/hospitals')
  end
end

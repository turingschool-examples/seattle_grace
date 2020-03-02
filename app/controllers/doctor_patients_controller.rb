class DoctorPatientsController < ApplicationController

  def destroy
    doctor_patient = DoctorPatient.find_by(patient_id: params[:id], doctor_id: params[:doctor_id])
    DoctorPatient.destroy(doctor_patient.id)
    redirect_to "/doctors/#{doctor_patient.doctor_id}"
  end
  
end

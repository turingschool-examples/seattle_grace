class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    docs_patient = doctor.patients.find(params[:patient_id])
    doctor.patients.delete(params[:patient_id])
  end
end

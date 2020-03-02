class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    docs_patient = doctor.patients.find(params[:id])
    doctor.patients.delete(params[:id])
  end
end

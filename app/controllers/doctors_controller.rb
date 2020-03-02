class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def remove_patient
    doctor = Doctor.find(params[:doctor_id])
    patient = doctor.find_doctor_patient(params[:patient_id])
    patient.destroy
    redirect_to "/doctors/#{doctor.id}"
  end
end

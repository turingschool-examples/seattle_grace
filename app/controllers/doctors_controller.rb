class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:doctor_id])
    patient = @doctor.patients.find(params[:patient_id])
    @doctor.remove_patient(patient)
    redirect_to "/doctors/#{@doctor.id}"
  end
end

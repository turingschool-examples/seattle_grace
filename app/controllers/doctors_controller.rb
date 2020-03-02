class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:id])
    # require "pry"; binding.pry
  end

  def destroy
    patient = Patient.find(params[:patient_id])
    doctor = Doctor.find(params[:doctor_id])
    patient.destroy
    redirect_to "/doctors/#{doctor.id}"
  end
end

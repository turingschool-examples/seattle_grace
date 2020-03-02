class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def destroy
    patient = Patient.find(params[:id])
    doctor = patient.doctors.first
    patient.destroy
    redirect_to "/doctors/#{doctor.id}"
  end

end

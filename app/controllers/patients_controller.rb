class PatientsController < ApplicationController

  def index
    @patients = Patient.all.order(age: :desc)
  end

  def destroy
    patient = Patient.find(params[:patient_id])
    doctor = Doctor.find(params[:doctor_id])
    patient.destroy
    redirect_to '/doctors/#{doctor.id}'
  end
end

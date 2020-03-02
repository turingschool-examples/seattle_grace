class PatientsController < ApplicationController

  def index
    @patients = order_patients
  end

  def destroy
    DoctorPatient.find_by(patient_id: params[:patient_id], doctor_id: params[:doctor_id]).delete
    redirect_to "/doctors/#{params[:doctor_id]}"
  end

  private

  def order_patients
    patients = Patient.all
    patients = patients.select(:name).order(age: :desc)
  end
end

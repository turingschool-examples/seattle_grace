class PatientsController < ApplicationController

  def index
    @patients = order_patients
  end

  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient = doctor.patients.find(params[:patient_id])
    DoctorPatient.find_by(patient_id: patient.id, doctor_id: doctor.id).delete
    redirect_to "/doctors/#{doctor.id}"
  end

  private

  def order_patients
    patients = Patient.all
    patients = patients.select(:name).order(age: :desc)
  end
end

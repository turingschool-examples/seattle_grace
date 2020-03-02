class PatientsController < ApplicationController
  def index
    @patients = Patient.in_order
  end
  
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:id])
    doctor_patient = DoctorPatient.where(doctor_id: doctor.id, patient_id: patient.id).first
    doctor_patient.destroy
    redirect_to "/doctors/#{doctor.id}"
  end
end
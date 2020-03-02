class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def destroy
    patient = Patient.find(params[:id])
    doctor = Doctor.find(params[:doctor_id]) if params[:doctor_id] != nil
    remove_all_traces_of_patient(doctor, patient)
    redirect_to "/doctors/#{doctor.id}"
  end


  private

  def remove_all_traces_of_patient(doctor, patient)
    doctor_patient = DoctorPatient.where(doctor_id: doctor.id, patient_id: patient.id).first
    doctor_patient.destroy
    patient.destroy
  end
end

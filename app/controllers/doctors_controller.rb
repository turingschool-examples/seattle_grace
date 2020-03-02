class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def remove_patient
    doctor = Doctor.find(params[:doctor_id])
    find_doctor_patient.destroy
    redirect_to "/doctors/#{doctor.id}"
  end

private
  def find_doctor_patient
    DoctorPatient.where(patient_id: params[:patient_id], doctor_id: params[:doctor_id]).first
  end
end

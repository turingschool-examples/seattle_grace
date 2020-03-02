class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def remove_patient
    doctor = Doctor.find(params[:doctor_id])
    doctor.remove(params[:patient_id])
    # doctor.patients.delete(Patient.where("patients.id = #{params[:patient_id]}"))
    # Patient.where("patients.id = #{params[:patient_id]}")
    # doctor.patients.where("patients.id = #{params[:patient_id]}")

    redirect_to "/doctors/#{doctor.id}"
  end
end

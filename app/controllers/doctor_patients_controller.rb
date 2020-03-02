class DoctorPatientsController < ApplicationController

  def destroy
    patient = Patient.find(params[:patient_id])
    doctor_path = "/doctors/#{params[:doctor_id]}"
    doctor_patient = DoctorPatient.where("patient_id = #{params[:patient_id]} and doctor_id = #{params[:doctor_id]}").first
    doctor_patient.destroy 
    patient.destroy
    redirect_to doctor_path
  end

end
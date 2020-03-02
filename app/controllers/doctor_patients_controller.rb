class DoctorPatientsController < ApplicationController

  def destroy
    doctor_path = "/doctors/#{params[:doctor_id]}"
    doctor_patient = DoctorPatient.where("patient_id = #{params[:patient_id]} and doctor_id = #{params[:doctor_id]}").first
    doctor_patient.destroy 
    redirect_to doctor_path
  end

end
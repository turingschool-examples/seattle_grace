class PatientDoctorsController < ApplicationController

  def destroy
    patient_doctor = PatientDoctor.find_by(doctor_id: params[:doctor_id], patient_id: params[:patient_id])
    patient_doctor.destroy
    redirect_to "/doctors/#{params[:doctor_id]}"
  end
end

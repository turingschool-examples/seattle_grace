class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:id])
    patient = DoctorPatient.find_by(doctor_id: params[:id], patient_id: params[:patient_id]).destroy
    redirect_to "/doctors/#{doctor.id}"
  end
end

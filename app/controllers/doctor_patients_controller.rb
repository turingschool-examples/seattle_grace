class DoctorPatientsController < ApplicationController
  def destroy
     patient = Patient.find(params[:id])
     doctor = Doctor.find(params[:doctor_id])
     DoctorPatient.where(patient: patient, doctor: doctor.id).destroy_all
     redirect_to "/doctors/#{doctor.id}"
  end
end
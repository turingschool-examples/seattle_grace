class DoctorPatientsController < ApplicationController

  def destroy
    doctor = Patient.find(params[:id]).doctors.first
    patient = Patient.find(params[:id])
  
    doctor.patients.delete(patient)
    redirect_to "/doctors/#{doctor.id}"
  end
end

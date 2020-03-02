class DoctorsController < ApplicationController

  def show
    @doctor = Doctor.find(params[:doctor_id])
  end

  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:patient_id])
    doctor_patient = DoctorPatient.find(doctor.doctr_patient(doctor, patient))
    doctor_patient.destroy
    redirect_to "/doctors/#{doctor.id}"
  end
end

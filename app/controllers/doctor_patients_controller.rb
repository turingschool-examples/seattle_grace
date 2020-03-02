class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:patient_id])
    doctor_patient = DoctorPatient.find_by(doctor_id: doctor.id, patient_id: patient.id)
    doctor_patient.destroy
    redirect_to "/doctors/#{doctor.id}"
  end
end

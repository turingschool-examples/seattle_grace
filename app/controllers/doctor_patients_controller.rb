class DoctorPatientsController < ApplicationController
  def destroy
    doctor_patient = DoctorPatient.find(params[:id])
    DoctorPatient.destroy(doctor_patient.id)
    redirect_back(fallback_location: doctor_path(doctor_patient.doctor))
  end
end

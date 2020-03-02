class DoctorPatientsController < ApplicationController
  def destroy
    doc = Patient.find(params[:patient_id]).doctors.last
    patient = Patient.find(params[:patient_id])
    doc.patients.delete(patient)

    redirect_to "/doctors/#{doc.id}"
  end
end

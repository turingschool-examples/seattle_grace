class PatientsController < ApplicationController
  def index
    @patients = Patient.order(age: :desc)
  end

  def destroy
    doc_patients = DoctorPatient.where(patient_id: params[:id])
    doc_patients.each do |doc_patient|
      doc_patient.destroy
    end
    Patient.destroy(params[:id])
    redirect_back(fallback_location: '/hospitals')
  end
end

class PatientStatusController < ApplicationController

	def destroy
		@doctor = Doctor.find(params[:doctor_id])
		@hospital = @doctor.hospital
		@patient = Patient.find(params[:patient_id])
		@doctor.patients.delete(@patient)
		redirect_to "/hospitals/#{@hospital.id}/doctors/#{@doctor.id}"
	end
end

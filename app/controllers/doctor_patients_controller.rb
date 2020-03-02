class DoctorPatientsController < ApplicationController


	def destroy
		doc = Doctor.find(params[:doc_id])
		patient = Patient.find(params[:id])
		doc.patients.delete(patient)
		doc.save
		redirect_back(fallback_location: "/hospitals")
	end

end

class DoctorsController < ApplicationController

	def show
		@doctor = Doctor.find(params[:doctor_id])
		@hospital = @doctor.hospital
	end
end

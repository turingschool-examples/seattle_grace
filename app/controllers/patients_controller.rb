class PatientsController < ApplicationController

	def index
		@patient_names = Patient.all_names_alpha
	end

end

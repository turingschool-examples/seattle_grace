class DoctorPatientsController < ApplicationController

  def destroy
    @doctor = Patient.find(params[:id]).doctors.first
    Patient.destroy(params[:id])

    redirect_to "/doctors/#{@doctor.id}"
  end
end

class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def destroy
    @patient = Patient.find(params[:id])
    @doctor = @patient.doctor

    @patient.destroy

    redirect_to doctor_path(@doctor)
  end
end

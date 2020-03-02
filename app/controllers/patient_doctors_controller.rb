class PatientDoctorsController < ApplicationController
  def destroy
    @patient = Patient.find(params[:id])
    @doctor = Doctor.find(params[:doctor_id])
    if @doctor.patients.delete(@patient)
      flash[:success] = 'Patient removed.'
      redirect_to doctor_path(@doctor)
    end
  end
end

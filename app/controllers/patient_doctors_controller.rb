class PatientDoctorsController < ApplicationController
  def destroy
    @patient = Patient.find(params[:id])
    doctor = @patient.doctors.ids
    if @patient.destroy
      flash[:success] = 'Patient removed.'
      redirect_to doctor_path(doctor)
    end
  end
end

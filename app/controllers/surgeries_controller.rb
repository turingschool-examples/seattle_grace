class SurgeriesController < ApplicationController
  def show
    @surgery = Surgery.find(params[:id])
  end

  def edit
    @surgery = Surgery.find(params[:id])
  end

  def update_doctors
    doctor = Doctor.find(params[:doctor_id])
    surgery = Surgery.find(params[:id])

    surgery.add_doctor(doctor)

    redirect_to surgery_path(surgery)
  end
end

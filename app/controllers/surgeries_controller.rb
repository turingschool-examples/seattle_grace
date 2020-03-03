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

    surgery.doctor_surgeries.create(doctor_id: doctor.id, surgery_id: surgery.id)

    redirect_to surgery_path(surgery)
  end
end

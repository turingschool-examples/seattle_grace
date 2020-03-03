class SurgeriesController < ApplicationController
  def show 
    @surgery = Surgery.find(params[:id])
  end 

  def add_doctor
    surgery = Surgery.find(params[:id])
    doctor = Doctor.find(params[:doctor_id])
    surgery.doctor << doctor
    redirect_to "/surgeries/#{surgery.id}"
  end


  
end 
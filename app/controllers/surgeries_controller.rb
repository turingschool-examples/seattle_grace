class SurgeriesController < ApplicationController 
  def show
    @doctor = Doctor.all
    @surgery = Surgery.find(params[:id])
  end

  def create 
    @doctor = Doctor.find(params[:id])
    @doctor.save 
    redirect_to surgeries_path
  end
end 
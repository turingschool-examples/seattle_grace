class DoctorsController < ApplicationController
  def show
    @doctors = Doctor.find(params[:id])
  end
end

class HospitalsController < ApplicationController

  def show
    @display = HospitalDisplay.new(Hospital.find(params[:id]))
  end

end
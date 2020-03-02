class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def destroy
    require "pry"; binding.pry
  end
end

class PatientsController < ApplicationController
  def index
    @patients = Patient.in_order
  end
end
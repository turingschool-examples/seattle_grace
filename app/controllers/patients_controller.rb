class PatientsController < ApplicationController
  def index
    @patients = Patient.order(:age).distinct
  end
end

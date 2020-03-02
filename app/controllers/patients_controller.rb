class PatientsController < ApplicationController

  def index
    patients = Patient.all
    @patients = patients.order(age: :desc)
  end
end

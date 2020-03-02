class PatientsController < ApplicationController

  def index
    @patients = order_patients
  end

  private

  def order_patients
    patients = Patient.all
    patients = patients.select(:name).order(age: :desc)
  end
end

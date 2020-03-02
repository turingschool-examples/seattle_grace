class PatientsController < ApplicationController

  def index
    @patients = Patient.all.ordered_by_age
  end
end

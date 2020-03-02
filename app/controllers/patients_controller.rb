class PatientsController < ApplicationController

  def index
    @patients = Patient.give_age_order
  end
end

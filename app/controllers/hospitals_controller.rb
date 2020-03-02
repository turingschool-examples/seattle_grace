class HospitalsController < ApplicationController

  def show
    @hospital = Hospital.find(params[:id])
    # require "pry"; binding.pry
  end
end

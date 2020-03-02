class HospitalsController < ApplicationController

  def show
    @hospital = Hospital.find(params[:id])
    @uniq_doc_uni = @hospital.docs_university
  end

end

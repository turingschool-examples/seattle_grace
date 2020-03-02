class HospitalDisplay
  attr_reader :hospital

  def initialize(hospital)
    @hospital = hospital
  end

  def doctor_count
    @hospital.doctors.count
  end

  def doctor_universities
    @hospital.doctors.select(:university).distinct.pluck(:university)
  end


end
class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def total_doctor_count
    doctors.count
  end

  def unique_universities
    doctors.distinct.pluck(:university)
  end
end

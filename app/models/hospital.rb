class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def total_doctor_count
    self.doctors.count
  end

  def unique_universities
    self.doctors.select(:university).distinct.pluck(:university)
  end
end

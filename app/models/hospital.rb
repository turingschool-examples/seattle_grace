class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def doctor_count
    doctors.count(:id)
  end

  def educations
    doctors.distinct.pluck(:university)
  end
end

class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def unique_unis
    doctors.distinct.pluck(:university)
  end

end

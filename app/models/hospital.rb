class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def universities
    doctors.select(:patients).select(:universities).distinct.pluck(:university)
  end
end

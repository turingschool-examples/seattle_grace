class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def university_list
    doctors.distinct(:university).pluck(:university)
  end
end

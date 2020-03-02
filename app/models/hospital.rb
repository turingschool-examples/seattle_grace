class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def get_count_of_doctors
    doctors.count
  end

  def get_universities
    doctors.pluck(:university)
  end
end

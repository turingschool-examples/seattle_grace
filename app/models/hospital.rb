class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def num_of_doctors
    doctors.count
  end

  def universities
    doctors.pluck(:university)
  end
end

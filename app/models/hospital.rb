class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def number_of_doctors
    doctors.count
  end

  def universities_attended
    doctors.select(:university).distinct.pluck(:university)
  end
end

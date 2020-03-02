class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def total_doctors
    doctors.count
  end

  def education
    doctors.pluck(:university).uniq
  end
end

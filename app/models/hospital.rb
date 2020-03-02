class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def count_doctors
    doctors.count
  end

  def distinct_universities
    doctors.pluck(:university).uniq
  end
end

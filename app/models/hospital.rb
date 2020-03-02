class Hospital <ApplicationRecord
  validates_presence_of :name

  has_many :doctors

  def doctor_count
    doctors.count(:id)
  end

  def universities
    doctors.select(:university).distinct.count
  end
end

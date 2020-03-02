class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors
  
  def num_doctors
    doctors.count
  end
  
  def unique_universities
    doctors.select(:university).distinct.pluck(:university)
  end
end

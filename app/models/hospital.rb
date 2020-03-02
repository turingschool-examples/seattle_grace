class Hospital <ApplicationRecord
  validates_presence_of :name

  has_many :doctors

  def doctor_count
    doctors.sum(:id).distinct
  end

  def universities
    
  end
end

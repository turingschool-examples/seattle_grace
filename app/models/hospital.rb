class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def doctor_total
    self.doctors.count
  end
end

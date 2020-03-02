class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def count_of_drs
    self.doctors.count
  end 
end

class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def count_of_drs
    self.doctors.count
  end 

  def distinct_unis
    # self.doctors.distinct.pluck(:university)
    self.doctors.pluck(:university).uniq
  end 
end

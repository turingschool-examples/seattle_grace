class Surgery <ApplicationRecord
  validates_presence_of :title, :day_of_opp, :operating_room_number
  has_many :doctor_surgeries
  has_many :doctor, through: :doctor_surgeries

  def count_of_drs
    self.doctor.count
  end 

  def same_day_surgeries(surgery)
    Surgery.where(day_of_opp: surgery.day_of_opp)
  end 
end
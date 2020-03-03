class Surgery <ApplicationRecord
  validates_presence_of :title, :day_of_week, :operating_room_number
  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def total_doctors
    doctors.count 
  end
end
class Surgery <ApplicationRecord
  validates_presence_of :title, :day_of_opp, :operating_room_number
  has_many :doctor_surgeries
  has_many :doctor, through: :doctor_surgeries
end
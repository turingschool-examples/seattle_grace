class Patient <ApplicationRecord
  validates_presence_of :name, :age
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients
end

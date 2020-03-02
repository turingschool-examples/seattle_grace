class Patient <ApplicationRecord
  validates_presence_of :name, :age

  has_many :doctor_patients, dependent: :destroy
  has_many :doctors, through: :doctor_patients

  def self.order_by_age
    Patient.order('patients.age DESC')
  end
end

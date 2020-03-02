class Patient <ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age

  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def find_patient_doctor(doctor)
    doctor_patients.where("doctor_patients.doctor_id = #{doctor.id}").first
  end
end

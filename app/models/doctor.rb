class Doctor <ApplicationRecord
  validates_presence_of :name, :specialty, :university
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def find_doctor_patient(patient_id)
    DoctorPatient.where(patient_id: patient_id, doctor_id: self.id).first
  end
end

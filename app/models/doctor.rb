class Doctor <ApplicationRecord
  validates_presence_of :name, :specialty, :university
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def doctr_patient(doctor, patient)
     DoctorPatient.where(patient_id: "#{patient.id}").where(doctor_id: "#{doctor.id}").pluck(:id).first
  end

end

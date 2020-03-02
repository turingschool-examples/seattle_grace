class Doctor <ApplicationRecord
  validates_presence_of :name, :specialty, :university
  belongs_to :hospital

  has_many :patient_doctors
  has_many :patients, through: :patient_doctors

end

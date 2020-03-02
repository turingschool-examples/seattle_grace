class Doctor <ApplicationRecord
  validates_presence_of :name, :specialty, :university
  belongs_to :hospital
  has_many :patient_doctors
  has_many :patients, through: :patient_doctors

  def patients_sorted
    patients.order(age: :desc)
    # patients.sort.reverse
  end

  def patient_names
    patients_sorted.map {|patient| patient.name}
  end
end

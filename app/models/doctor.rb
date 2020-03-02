class Doctor <ApplicationRecord
  validates_presence_of :name, :specialty, :university

  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def self.unique_education
    select(:university).distinct
  end
end

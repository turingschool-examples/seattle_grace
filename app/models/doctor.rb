class Doctor <ApplicationRecord
  validates_presence_of :name, :specialty, :university

  belongs_to :hospital
	has_many :doctor_patients
	has_many :patients, through: :doctor_patients


	def self.uniq_universities
		order(university: :asc).distinct.pluck(:university)
	end
end

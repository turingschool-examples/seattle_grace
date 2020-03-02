class Patient < ApplicationRecord
        has_many :doctor_patients
        has_many :doctors, through: :doctor_patients

        validates_presence_of :name
        validates_presence_of :age


	def self.all_names_alpha
		Patient.order(age: :desc).pluck(:name)
	end
end

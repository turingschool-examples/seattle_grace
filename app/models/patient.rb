class Patient < ApplicationRecord
  validates_presence_of :name, :age

  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  # def self.patient_list_by_age
  #   require "pry"; binding.pry
  #   .order(:age)
  # end
  def self.patient_list_by_age
    order('age desc')
  end
end

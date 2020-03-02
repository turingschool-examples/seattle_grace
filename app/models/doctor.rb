class Doctor < ApplicationRecord
  validates_presence_of :name, :specialty, :university
  has_many :patients
  belongs_to :hospital
end

# Because I completely forgot to set this up as a many-to-many and set it up as a one-to-meny, my has_many should look more like
#     has_many :patients, through: :doctor_patients
#     has_many :doctor_patients

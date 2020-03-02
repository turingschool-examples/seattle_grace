class Patient < ApplicationRecord
  validates_presence_of :name, :age

  belongs_to :doctor
end

# Because I completely forgot to set this up as a many-to-many and set it up as a one-to-meny, my has_many should look more like
#     has_many :doctors, through: :doctor_patients
#     has_many :doctor_patients

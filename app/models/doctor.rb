class Doctor < ApplicationRecord
  validates_presence_of :name, :specialty, :university
  has_many :patients
  belongs_to :hospital
end

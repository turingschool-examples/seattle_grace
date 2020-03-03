class Surgery < ApplicationRecord

  validates_presence_of :title
  validates_presence_of :day
  validates_presence_of :or_numer

  belongs_to :hospital

  has_many :surgery_doctors
  has_many :doctors, through: :surgery_doctors

end

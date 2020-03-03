class Surgery < ApplicationRecord

  validates_presence_of :title
  validates_presence_of :day
  validates_presence_of :or_number

  # belongs_to :hospital

  has_many :surgery_doctors
  has_many :doctors, through: :surgery_doctors

  def doctor_count
    Doctor.count
  end

end

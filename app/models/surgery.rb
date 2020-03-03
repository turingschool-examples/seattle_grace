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

  def others_today
    require "pry"; binding.pry
    # Surgery.pluck(:title)
    where('day Monday').pluck(:title)
    # Surgery.select(:title).where(‘day = Monday’)
    #need to sort where day == day of current surgery NOT hard-coded
  end

end

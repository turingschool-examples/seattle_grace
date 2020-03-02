class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def distinct_universities
    # require "pry"; binding.pry
    doctors.distinct.pluck(:university)
  end

  def count_doctors
    doctors.count
  end
end

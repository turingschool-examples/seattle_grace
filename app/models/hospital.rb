class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def totals_docs
    require "pry"; binding.pry
    doctors.sum(:name)
  end

  def unique_schools
    doctors.select(:university).distinct
  end
end

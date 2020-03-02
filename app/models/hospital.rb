class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def unique_schools
    doctors.select(:university).distinct
  end
end

class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def num_doctors
    doctors.count
  end

  def doc_universities
    doctors.pluck(:university).uniq
  end
end

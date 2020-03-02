class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def docs_university
    doctors.select(:university).distinct.pluck(:university)
  end

  def number_of_docs
    doctors.count
  end
end

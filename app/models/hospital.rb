class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def number_of_doctors
    doctors.count
  end

  def unique_universities
    doctors.where('hospital_id = ?', self.id).pluck(:university).uniq
  end
end

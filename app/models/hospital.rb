class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors

  def doctor_count
    Doctor.all.count
  end

  def univ_list_unique
    # University.name.unique
  end
end

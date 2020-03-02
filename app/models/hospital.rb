class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors
  has_many :patients, through: :doctors


  def doctor_count
    doctors.count
  end





end

class Patient <ApplicationRecord
  validates_presence_of :name, :age
  has_many :doctors
end

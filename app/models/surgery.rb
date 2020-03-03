class Surgery < ApplicationRecord
  validates_presence_of :title,
                        :day,
                        :operating_room

  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def doc_count
    doctors.count
  end
end

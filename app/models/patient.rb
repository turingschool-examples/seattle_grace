class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def self.by_age
    order(:age).reverse_order.distinct
  end
end

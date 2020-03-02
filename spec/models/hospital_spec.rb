require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe 'methods' do
    it 'doctor_total' do
      hospital1 = Hospital.create!({name: "Cleveland Clinic"})

      doctor1 = Doctor.create!({
        name: "Alan Dreamy",
        specialty: "Podiatry",
        university: "Yale",
        hospital_id: hospital1.id
        })

      doctor3 = Doctor.create({
        name: "Chance Benner",
        specialty: "Internal Medicine",
        university: "Ohio University",
        hospital_id: hospital1.id
        })

      hospital1.doctors << [doctor1, doctor3]

      expect(hospital1.doctor_total).to eq(2)
    end
  end
end

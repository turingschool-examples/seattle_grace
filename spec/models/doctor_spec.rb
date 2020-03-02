require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :specialty}
    it {should validate_presence_of :university}
  end
  describe 'relationships' do
    it {should belong_to :hospital}

    it {should have_many :patient_doctors}
    it {should have_many(:patients).through(:patient_doctors)}
  end
end

# hospital1 = Hospital.create({name: "Cleveland Clinic"})
# hospital2 = Hospital.create({name: "Johns Hopkins"})
# hospital3 = Hospital.create({name: "Wexner Medical"})
#
# doctor1 = Doctor.create!({
#   name: "Alan Dreamy",
#   specialty: "Podiatry",
#   university: "Yale",
#   hospital: hospital1.id
#   })
#
# doctor2 = Doctor.create({
#   name: "Dr. Hawking",
#   specialty: "Quadripeligics",
#   university: "Oxford",
#   hospital: hospital2.id
#   })
#
# doctor3 = Doctor.create({
#   name: "Chance Benner",
#   specialty: "Internal Medicine",
#   university: "Ohio University",
#   hospital: hospital1.id
#   })
#
# doctor4 = Doctor.create({
#   name: "Gabriel Wohl",
#   specialty: "Nutrition",
#   university: "Case Western",
#   hospital: hospital3.id
#   })

# doctor5 = Doctor.create({
#   name: "Steve",
#   specialty: "Osteopathy",
#   university: "Case Western",
#   hospital: hospital2.id
#   })
# doctor6 = Doctor.create({
#   name: "Dr. Strangelove",
#   specialty: "Alchemy",
#   university: "The Citadel",
#   hospital: hospital3.id
#   })
#
#   hospital1.doctors << [doctor1, doctor3]
#   hospital2.doctors << [doctor2, doctor5]
#   hospital3.doctors << [doctor4, doctor6]

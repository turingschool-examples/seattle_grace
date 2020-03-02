require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end
  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  it '.patient_list_by_age' do
    hosp1 = Hospital.create!(name: "Mass General")

    doc1 = hosp1.doctors.create!(name: "Hawkeye", specialty: "Thorasic", university: "UMass")
    doc2 = hosp1.doctors.create!(name: "Hunicut", specialty: "Vascular", university: "Minnesota")

    patient1 = doc1.patients.create!(name: "Katie Bryce",
    age: 24)
    patient2 = doc1.patients.create!(name: "Denny Duquette",
    age: 39)
    patient3 = doc2.patients.create!(name: "Rebecca Pope",
    age: 32)
    patient4 = doc2.patients.create!(name: "Donald Trump",
    age: 76)

    expect(Patient.patient_list_by_age).to eq([patient4, patient2, patient3, patient1])
  end
end

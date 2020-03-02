require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end
  describe 'instance methods' do
    it 'doctor_count' do
        hospital_1 = Hospital.create!(name: "Seattle Grace")
        hospital_2 = Hospital.create!(name: "Sacred Heart")
        doctor_1 = hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard")
        doctor_2 = hospital_1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins")
        doctor_3 = hospital_1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Harvard")
        doctor_4 = hospital_2.doctors.create!(name: "Gregg", specialty: "General Surgery", university: "Stanford")
        patient_1 = doctor_1.patients.create!(name: "Katie Bryce", age: "24")
        patient_2 = doctor_1.patients.create!(name: "Denny Duquette", age: "22")
        patient_3 = doctor_2.patients.create!(name: "Danny DeVito", age: "56")
      expect(hospital_1.doctor_count).to eq(3)
      expect(hospital_2.doctor_count).to eq(1)
    end
    it 'universities' do
        hospital_1 = Hospital.create!(name: "Seattle Grace")
        hospital_2 = Hospital.create!(name: "Sacred Heart")
        doctor_1 = hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard")
        doctor_2 = hospital_1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins")
        doctor_3 = hospital_1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Harvard")
        doctor_4 = hospital_2.doctors.create!(name: "Gregg", specialty: "General Surgery", university: "Stanford")
        patient_1 = doctor_1.patients.create!(name: "Katie Bryce", age: "24")
        patient_2 = doctor_1.patients.create!(name: "Denny Duquette", age: "22")
        patient_3 = doctor_2.patients.create!(name: "Danny DeVito", age: "56")
      expect(hospital_1.universities).to eq([doctor_1.university, doctor_2.university])
      expect(hospital_2.universities).to eq([doctor_4.university])
    end
  end
end

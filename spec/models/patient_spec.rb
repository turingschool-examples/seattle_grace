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
  describe 'methods' do
    it 'by_age' do
      hospital1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      hospital2 = Hospital.create!(name: 'Pacific Northwest General Hospital')
      doctor1 = Doctor.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University', hospital: hospital1)
      doctor2 = Doctor.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University', hospital: hospital1)
      Doctor.create!(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University', hospital: hospital2)
      patient1 = Patient.create!(name: 'Katie Bryce', age: 24)
      patient2 = Patient.create!(name: 'Denny Duquette', age: 39)
      patient3 = Patient.create!(name: 'Rebecca Pope', age: 32)
      patient4 = Patient.create!(name: 'Zola Shepherd', age: 2)
      doctor1.patients << [patient1, patient3, patient4]
      doctor2.patients << [patient2]

      expect(Patient.by_age).to eq([patient2, patient3, patient1, patient4])
    end
  end
end

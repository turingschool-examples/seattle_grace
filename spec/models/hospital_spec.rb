require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end
  describe 'methods' do
    it 'doctor_count' do
      hospital1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      hospital2 = Hospital.create!(name: 'Pacific Northwest General Hospital')
      doctor1 = Doctor.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University', hospital: hospital1)
      doctor2 = Doctor.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University', hospital: hospital1)
      doctor3 = Doctor.create!(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University', hospital: hospital2)
      patient1 = Patient.create!(name: 'Katie Bryce', age: 24)
      patient2 = Patient.create!(name: 'Denny Duquette', age: 39)
      patient3 = Patient.create!(name: 'Rebecca Pope', age: 32)
      patient4 = Patient.create!(name: 'Zola Shepherd', age: 2)
      hospital1.doctors << [doctor1, doctor2]
      hospital2.doctors << [doctor3]
      doctor1.patients << [patient1, patient3, patient4]
      doctor2.patients << [patient2]

      expect(hospital1.doctor_count).to eq(2)
      expect(hospital2.doctor_count).to eq(1)
    end
  end
end

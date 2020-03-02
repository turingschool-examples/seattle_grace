require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'from the hospital show page' do
    it "I see the hospital's name, number of doctors, and universities" do
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

      visit hospital_path(hospital1.id)

      expect(page).to have_content(hospital1.name)
      expect(page).to_not have_content(hospital2.name)
      expect(page).to have_content("Number of doctors: 2")
      expect(page).to have_content("Universities that this hospital's doctors attended: Harvard University, Johns Hopkins University")
      expect(page).to_not have_content("Stanford University")
    end
  end
end

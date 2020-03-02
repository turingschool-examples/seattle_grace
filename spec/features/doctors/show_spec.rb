require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'from the doctor show page' do
    it "I see all of that doctor's information and that doctor's patients" do
      hospital1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      hospital2 = Hospital.create!(name: 'Pacific Northwest General Hospital')
      doctor1 = Doctor.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University', hospital: hospital1)
      doctor2 = Doctor.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University', hospital: hospital1)
      Doctor.create!(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University', hospital: hospital2)
      patient1 = Patient.create!(name: 'Katie Bryce', age: 24)
      patient2 = Patient.create!(name: 'Denny Duquette', age: 39)
      patient3 = Patient.create!(name: 'Rebecca Pope', age: 32)
      patient4 = Patient.create!(name: 'Zola Shepherd', age: 2)
      patient5 = Patient.create!(name: 'John Lennon', age: 79)
      doctor1.patients << [patient1, patient3, patient4, patient5]
      doctor2.patients << [patient2, patient5]

      visit doctor_path(doctor1.id)

      within('#name') do
        expect(page).to have_content(doctor1.name)
        expect(page).to_not have_content(doctor2.name)
      end
      within('#specialty') do
        expect(page).to have_content(doctor1.specialty)
        expect(page).to_not have_content(doctor2.specialty)
      end
      within('#university') do
        expect(page).to have_content(doctor1.university)
        expect(page).to_not have_content(doctor2.university)
      end
      within('#hospital') do
        expect(page).to have_content(hospital1.name)
        expect(page).to_not have_content(hospital2.name)
      end
      within('#patients') do
        expect(page).to have_content(patient1.name)
        expect(page).to have_content(patient3.name)
        expect(page).to have_content(patient4.name)
        expect(page).to have_content(patient5.name)
        expect(page).to_not have_content(patient2.name)
      end

      visit doctor_path(doctor2.id)

      within('#patients') do
        expect(page).to_not have_content(patient1.name)
        expect(page).to_not have_content(patient3.name)
        expect(page).to_not have_content(patient4.name)
        expect(page).to have_content(patient5.name)
        expect(page).to have_content(patient2.name)
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'from the doctor show page' do
    it "I see remove a patient from a doctor's caseload" do
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

      visit doctor_path(doctor1)

      within("#patient-#{patient4.id}") { click_button ('Remove this patient') }

      expect(current_path).to eq(doctor_path(doctor1.id))
      expect(page).to_not have_css("#patient-#{patient4.id}")
      expect(page).to have_css("#patient-#{patient1.id}")
      expect(page).to have_css("#patient-#{patient3.id}")

      within("#patient-#{patient5.id}") { click_button ('Remove this patient') }

      expect(current_path).to eq(doctor_path(doctor1.id))
      expect(page).to_not have_css("#patient-#{patient5.id}")
      expect(page).to have_css("#patient-#{patient1.id}")
      expect(page).to have_css("#patient-#{patient3.id}")

      visit doctor_path(doctor2)
      expect(page).to have_css("#patient-#{patient2.id}")
      expect(page).to have_css("#patient-#{patient5.id}")
      expect(page).to_not have_css("#patient-#{patient1.id}")
      expect(page).to_not have_css("#patient-#{patient3.id}")

      visit patients_path

      expect(page).to have_content(patient4.name)
      expect(page).to have_content(patient5.name)
    end
  end
end

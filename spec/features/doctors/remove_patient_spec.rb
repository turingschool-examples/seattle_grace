require 'rails_helper'

describe "I may remove a patient from a doctor" do
  describe "As a visitor when I visit a doctors show page" do
    it "I see a button next to each patient to `Remove From Caseload`" do
      hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      hospital_2 = Hospital.create!(name: "Pacific Northwest General Hospital")
      doctor_1 = hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      doctor_2 = hospital_2.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
      patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
      patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
      patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)
      doctor_1.patients << patient_1
      doctor_1.patients << patient_2
      doctor_1.patients << patient_3
      doctor_2.patients << patient_1
      doctor_2.patients << patient_2
      doctor_2.patients << patient_3
      doctor_2.patients << patient_4

      visit "/doctors/#{doctor_1.id}"

      expect(page).to have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)
      expect(page).to have_content(patient_3.name)

      within "#patient-#{patient_1.id}" do
        click_link "Remove From Caseload"
      end

      expect(current_path).to eq("/doctors/#{doctor_1.id}")
      expect(page).not_to have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)
      expect(page).to have_content(patient_3.name)

      within "#patient-#{patient_2.id}" do
        click_link "Remove From Caseload"
      end

      expect(current_path).to eq("/doctors/#{doctor_1.id}")
      expect(page).not_to have_content(patient_1.name)
      expect(page).not_to have_content(patient_2.name)
      expect(page).to have_content(patient_3.name)

  # The other doctor should still have their full, original caseload
      visit "/doctors/#{doctor_2.id}"

      expect(page).to have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)
      expect(page).to have_content(patient_3.name)
      expect(page).to have_content(patient_4.name)
    end
  end
end

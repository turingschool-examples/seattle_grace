# User Story 2, Patient Index Page
# ​
# As a visitor
# When I visit the patient index page
# I see the names of all patients listed from oldest to youngest

require 'rails_helper'

describe "Patient Index Page" do
  describe "As a visitor" do
    it "shows the name of each patient listed by age in descending order" do
      patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
      patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
      patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)

      visit '/patients'

      expect(page).to have_content("All Patients, Oldest to Youngest")

      within "#patient-#{patient_1.id}" do
        expect(page).to have_content(patient_1.name)
      end

      within "#patient-#{patient_2.id}" do
        expect(page).to have_content(patient_2.name)
      end

      within "#patient-#{patient_3.id}" do
        expect(page).to have_content(patient_3.name)
      end

      within "#patient-#{patient_4.id}" do
        expect(page).to have_content(patient_4.name)
      end
    end
  end
end

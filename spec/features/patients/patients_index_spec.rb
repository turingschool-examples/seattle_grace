require 'rails_helper'

RSpec.describe 'As a Visitor' do
	describe "When I visit the patient index page" do
		it 'I see list of all patients from oldest to youngest' do
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

      visit patients_path

      expect(page).to have_content(patient1.name)
      expect(page).to have_content(patient3.name)
      expect(page).to have_content(patient2.name)
      expect(page).to have_content(patient4.name)
    end
  end
end


      # User Story 2, Patient Index Page
      # ​
      # As a visitor
      # When I visit the patient index page
      # I see the names of all patients listed from oldest to youngest

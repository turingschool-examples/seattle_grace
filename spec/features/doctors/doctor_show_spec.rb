require 'rails_helper'

RSpec.describe 'As a Visitor' do
	describe "When I visit an doctor's show page" do
		it 'I see name, specialty, university, hospital and list of its patients' do
      hosp1 = Hospital.create!(name: "Mass General")
      doc1 = hosp1.doctors.create!(name: "Hawkeye", specialty: "Thorasic", university: "UMass")
      patient1 = doc1.patients.create!(name: "Katie Bryce",
      age: 24)
      patient2 = doc1.patients.create!(name: "Denny Duquette",
      age: 39)

      visit "/doctors/#{doc1.id}"

      expect(page).to have_content(doc1.name)
      expect(page).to have_content(doc1.specialty)
      expect(page).to have_content(doc1.university)
      expect(page).to have_content("Denny Duquette")
      expect(page).to have_content("Katie Bryce")
    end
  end
end

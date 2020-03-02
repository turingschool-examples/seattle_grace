require 'rails_helper'

RSpec.describe 'As a Visitor' do
	describe "When I visit an hospital's show page" do

    before (:each) do
      @hosp1 = Hospital.create!(name: "Mass General")

      @doc1 = @hosp1.doctors.create!(name: "Hawkeye", specialty: "Thorasic", university: "UMass")
      @doc2 = @hosp1.doctors.create!(name: "Hunicut", specialty: "Vascular", university: "Minnesota")
      @doc3 = @hosp1.doctors.create!(name: "Burns", specialty: "GP", university: "Minnesota")

      # patient1 = doc1.patients.create!(name: "Katie Bryce",
      # age: 24)
      # patient2 = doc1.patients.create!(name: "Denny Duquette",
      # age: 39)
      # patient3 = doc2.patients.create!(name: "Rebecca Pope",
      # age: 32)
      # patient4 = doc2.patients.create!(name: "Donald Trump",
      # age: 76)

      visit hospitals_path
    end

    it 'I see hospital name' do
      expect(page).to have_content(@hosp1.name)
    end

    it 'I see the number of doctors working there' do
      expect(page).to have_content(@doc1.name)
      expect(page).to have_content(@doc2.name)
      expect(page).to have_content(@doc3.name)
    end

    it "I see a unique list of universities that this hospital's doctors attended" do
      expect(page).to have_content("UMass")
      expect(page).to have_content("Minnesota")
    end
  end
end


# User Story 3, Hospital Show Page
# ​
# As a visitor
# When I visit a hospital's show page
# I see the hospital's name
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended

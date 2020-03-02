require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do
  describe 'when I visit the hospital show page' do
    it 'can see the number of doctors that work there and unique list of universities' do
      hs1 = Hospital.create!(name: "Johns Hopkins")
      dr1 = hs1.doctors.create!(name: "Matt", specialty: "brains", university: "GVSU", )
      dr2 = hs1.doctors.create!(name: "Meghan", specialty: "holistics", university: "Community College")
      dr3 = hs1.doctors.create!(name: "Zeke", specialty: "kidney stuff", university: "Community College")

      hs2 = Hospital.create!(name: "Hope")
      dr3 = hs2.doctors.create!(name: "Dave", specialty: "kidney stuff", university: "UCSB")

      visit "/hospitals/#{hs1.id}"
      expect(page).to have_content(hs1.name)
      expect(page).to have_content("Number of Doctors: 3")
      expect(page).to have_content(dr1.university)
      expect(page).to have_content(dr2.university)

      expect(page).to_not have_content(hs2.name)
      expect(page).to_not have_content(dr3.university)
    end
  end
end

# ```
# User Story 3, Hospital Show Page
# ​
# As a visitor
# When I visit a hospital's show page
# I see the hospital's name
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended
# ```

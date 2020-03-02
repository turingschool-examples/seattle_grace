require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do
  describe 'when I visit the patient index page' do
    it 'can see all of the patients listed from oldest to youngest' do

      pt1 = Patient.create!(name: "Kathleen", age: 10)
      pt2 = Patient.create!(name: "Zeke", age: 20)
      pt3 = Patient.create!(name: "Meg", age: 21)

      visit "/patients"
      expect(page).to have_content(pt1.name)
      expect(page).to have_content(pt2.name)
      expect(page).to have_content(pt3.name)
    end
  end
end

# ```
# User Story 2, Patient Index Page
# ​
# As a visitor
# When I visit the patient index page
# I see the names of all patients listed from oldest to youngest
# ```

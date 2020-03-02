require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do
  describe 'when I visit the doctor show page' do
    it 'can see all of that doctors information including name, specialty, university, name of hos and all patients' do
      hs1 = Hospital.create!(name: "Johns Hopkins")
      hs2 = Hospital.create!(name: "Hope")
      dr1 = hs1.doctors.create!(name: "Matt", specialty: "brains", university: "GVSU", )
      dr2 = hs2.doctors.create!(name: "Meghan", specialty: "holistics", university: "Community College")
      pt1 = dr1.patients.create!(name: "Kathleen", age: 10)
      pt2 = dr1.patients.create!(name: "Zeke", age: 20)
      pt3 = dr2.patients.create!(name: "Meg", age: 20)

      visit "/doctors/#{dr1.id}"
      expect(page).to have_content(dr1.name)
      expect(page).to have_content(dr1.specialty)
      expect(page).to have_content(dr1.university)
      expect(page).to have_content(hs1.name)

      within "#pt-#{pt1.id}" do
        expect(page).to have_content(pt1.name)
      end

      within "#pt-#{pt2.id}" do
        expect(page).to have_content(pt2.name)
      end

      expect(page).to_not have_content(pt3.name)
    end

    it "can remove a patient from the doctor workload" do
      hs1 = Hospital.create!(name: "Johns Hopkins")
      dr1 = hs1.doctors.create!(name: "Matt", specialty: "brains", university: "GVSU", )
      pt1 = dr1.patients.create!(name: "Kathleen", age: 10)
      pt2 = dr1.patients.create!(name: "Zeke", age: 20)

      visit "/doctors/#{dr1.id}"

      within "#pt-#{pt1.id}" do
        expect(page).to have_content(pt1.name)
        click_on "Remove Patient"
      end

      expect(current_path).to eq("/doctors/#{dr1.id}")
      expect(page).to_not have_content(pt1.name)
    end
  end
end

# User Story 4, Remove a Patient from a Doctor
# ​
# As a visitor
# When I visit a Doctor's show page
# Next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed

#
# User Story 1, Doctors Show Page
# ​
# As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#   - name
#   - specialty
#   - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has
# ```

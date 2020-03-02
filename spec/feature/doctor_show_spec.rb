require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do
  describe 'when I visit the doctor show page' do
    it 'can see all of that doctors information including name, specialty, university, name of hos and all patients' do
      dr1 = Doctor.create!(name: "Matt", specialty: "brains", university: "GVSU")
      dr2 = Doctor.create!(name: "Meghan", specialty: "holistics", university: "Community College")
      hs1 = dr1.hospitals.create!(name: "Johns Hopkins")
      hs2 = dr2.hospitals.create!(name: "Hope")
      pt1 = Patient.create!(name: "Kathleen", age: 10)
      pt2 = Patient.create!(name: "Zeke", age: 20)
      dp1 = DoctorPatients.create!(doctor_id: dr1.id, patient_id: pt1.id)
      dp2 = DoctorPatients.create!(doctor_id: dr2.id, patient_id: pt2.id)

      visit "doctors/#{dr1.id}"
      expect(page).to have_content(dr1.name)
      expect(page).to have_content(dr1.specialty)
      expect(page).to have_content(dr1.university)
      expect(page).to have_content(hs1.name)
      expect(page).to have_content(pt1.name)
    end
  end
end

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

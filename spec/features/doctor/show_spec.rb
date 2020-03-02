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

require 'rails_helper'

describe "Doctor's Show Page" do
  describe "As a visitor" do
    it "shows all of that doctors information, including their name, specialty, and university.
      I also see the hospital name, and all of the patients that doctor has worked with" do
      hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      hospital_2 = Hospital.create!(name: "Pacific Northwest General Hospital")
      hospital_3 = Hospital.create!(name: "New York Hospital")
      hospital_4 = Hospital.create!(name: "Seattle Grace Hospital")
      doctor_1 = hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      doctor_1 = hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      doctor_2 = hospital_2.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
      doctor_3 = hospital_3.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      doctor_4 = hospital_4.doctors.create!(name: "Derek Webber", specialty: "Attending Surgeon", university: "University of Pennsylvania")
      patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
      patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
      patient_3 = Patient.create!(name: "Rebecca Pope", age: 32)
      patient_4 = Patient.create!(name: "Zola Shepherd", age: 2)
      doctor_1.patients << patient_1
      doctor_1.patients << patient_2
      doctor_2.patients << patient_2
      doctor_3.patients << patient_3
      doctor_3.patients << patient_4
      doctor_3.patients << patient_4

      visit "/doctors/#{doctor_1.id}"

      expect(page).to have_content(doctor_1.name)
      expect(page).to have_content(doctor_1.specialty)
      expect(page).to have_content(doctor_1.university)
      expect(page).to have_content(doctor_1.hospital)
      expect(page).to have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)

      expect(page).not_to have_content(doctor_2.name)
      expect(page).not_to have_content(doctor_4.specialty)
      expect(page).not_to have_content(doctor_3.university)
      expect(page).not_to have_content(doctor_4.hospital)
      expect(page).not_to have_content(patient_3.name)
      expect(page).not_to have_content(patient_4.name)

      visit "/doctors/#{doctor_3.id}"

      expect(page).to have_content(doctor_3.name)
      expect(page).to have_content(doctor_3.specialty)
      expect(page).to have_content(doctor_3.university)
      expect(page).to have_content(doctor_3.hospital)
      expect(page).to have_content(patient_3.name)
      expect(page).to have_content(patient_4.name)

      expect(page).not_to have_content(doctor_1.name)
      expect(page).not_to have_content(doctor_2.specialty)
      expect(page).not_to have_content(doctor_1.university)
      expect(page).not_to have_content(doctor_4.hospital)
      expect(page).not_to have_content(patient_1.name)
      expect(page).not_to have_content(patient_2.name)
    end
  end
end

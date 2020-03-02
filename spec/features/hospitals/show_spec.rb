require 'rails_helper'

describe "Hospital Show Page" do
  describe "As a visitor" do
    it "Shows the number of doctors who work at this hospital and a unique list
      of universities that the doctors have attented" do
      hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      hospital_2 = Hospital.create!(name: "Pacific Northwest General Hospital")
      doctor_1 = hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      doctor_2 = hospital_1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
      doctor_3 = hospital_1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      doctor_4 = hospital_2.doctors.create!(name: "Derek Webber", specialty: "Attending Surgeon", university: "University of Pennsylvania")
      doctor_5 = hospital_2.doctors.create!(name: "James McGraph", specialty: "Some Doctor Dude", university: "University of Docs")
      doctor_6 = hospital_2.doctors.create!(name: "Sara McGraph", specialty: "Some Doctor Chick", university: "University of Docs")

      visit "/hospitals/#{hospital_1.id}"

      expect(page).to have_content(hospital_1.name)
      expect(page).to have_content("Doctors At Hospital: 3")
      expect(page).to have_content(doctor_1.university)
      expect(page).to have_content(doctor_2.university)
      expect(page).to have_content(doctor_3.university)

      expect(page).not_to have_content(hospital_2.name)
      expect(page).not_to have_content("Doctors At Hospital: 3")
      expect(page).not_to have_content(doctor_4.university)
      expect(page).not_to have_content(doctor_5.university)
      expect(page).not_to have_content(doctor_6.university)

      visit "/hospitals/#{hospital_2.id}"

      expect(page).to have_content(hospital_2.name)
      expect(page).to have_content("Doctors At Hospital: 3")
      expect(page).to have_content(doctor_4.university)
      expect(page).to have_content(doctor_5.university)

      expect(page).not_to have_content(hospital_1.name)
      expect(page).not_to have_content("Doctors At Hospital: 3")
      expect(page).not_to have_content(doctor_1.university)
      expect(page).not_to have_content(doctor_2.university)
      expect(page).not_to have_content(doctor_3.university)
    end
  end
end

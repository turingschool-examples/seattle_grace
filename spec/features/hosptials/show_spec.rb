require 'rails_helper'

RSpec.describe "Hospital Show Page" do
    it "can see the hospital's information" do
    Hospital.destroy_all
    Doctor.destroy_all

    hospital_1 = Hospital.create(
      name: "Grey Sloan Memorial Hospital"
      )

    hospital_2 = Hospital.create(
      name: "Pacific Northwest General Hospital"
      )

    doctor_1 = Doctor.create!(
        name: "Meredith Grey",
        specialty: "General Surgery",
        university: "Harvard",
        hospital: hospital_1
      )

    doctor_2 = Doctor.create!(
        name: "Alex Karev",
        specialty: "Pediatric Surgery",
        university: "Johns Hopkins University",
        hospital: hospital_1
      )

    doctor_3 = Doctor.create!(
        name: "Miranda Bailey",
        specialty: "General Surgery",
        university: "Stanford University",
        hospital: hospital_2
      )

    doctor_4 = Doctor.create!(
        name: "Not a doctor. Just need a university",
        specialty: "Soemthing",
        university: "Johns Hopkins University",
        hospital: hospital_1
      )


    visit "/hospitals/#{hospital_1.id}"

    expect(page).to have_content(hospital_1.name)
    expect(page).to have_content("Number of Doctors: 3")
    expect(page).to have_content(doctor_1.university)
    expect(page).to have_content(doctor_2.university)

    expect(page).not_to have_content(hospital_2.name)
    expect(page).not_to have_content(doctor_3.university)
  end
end

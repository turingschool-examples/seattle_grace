require 'rails_helper'

RSpec.describe "Hospital Show Page" do
  it "can see the hospitals name and number of doctors" do
    hospital_1 = Hospital.create(name: "Seattle Grace Hospital")
    hospital_2 = Hospital.create(name: "New York Hospital")
    doctor_1 = Doctor.create(name: "Meredith Grey",
                            specialty: "General Surgery",
                            university: "Harvard University")
    doctor_2 = Doctor.create(name: "Alex Karev",
                            specialty: "Pediatric Surgery",
                            university: "Johns Hopkins University")
    doctor_3 = Doctor.create(name: "Derek McDreamy Shepherd",
                            specialty: "Attending Surgeon",
                            university: "University of Pennsylvania")
    doctor_4 = Doctor.create(name: "iranda Bailey",
                            specialty: "General Surgery",
                            university: "Stanford University")

    hospital_1.doctors << doctor_1
    hospital_1.doctors << doctor_2
    hospital_1.doctors << doctor_3
    hospital_2.doctors << doctor_4

    visit hospital_path(hospital_1)

    expect(page).to have_content(hospital_1.name)
    expect(page).to_not have_content(hospital_2.name)
    expect(page).to have_content("Total Doctors: 3")
  end

  it "can see a unique list of universities" do
    hospital_1 = Hospital.create(name: "Seattle Grace Hospital")
    hospital_2 = Hospital.create(name: "New York Hospital")
    doctor_1 = Doctor.create(name: "Meredith Grey",
                            specialty: "General Surgery",
                            university: "Harvard University")
    doctor_2 = Doctor.create(name: "Alex Karev",
                            specialty: "Pediatric Surgery",
                            university: "Johns Hopkins University")
    doctor_3 = Doctor.create(name: "Derek McDreamy Shepherd",
                            specialty: "Attending Surgeon",
                            university: "Harvard University")
    doctor_4 = Doctor.create(name: "Miranda Bailey",
                            specialty: "General Surgery",
                            university: "Stanford University")

    hospital_1.doctors << doctor_1
    hospital_1.doctors << doctor_2
    hospital_1.doctors << doctor_3
    hospital_2.doctors << doctor_4

    visit hospital_path(hospital_1)

    expect(page).to have_content(doctor_1.university)
    expect(page).to have_content(doctor_2.university)
    expect(page).to_not have_content(doctor_4.name)
  end
end

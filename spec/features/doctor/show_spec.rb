require 'rails_helper'

RSpec.describe "Doctor Show Page" do
  it "can see the doctors information" do
    hospital_1 = Hospital.create(name: "Seattle Grace Hospital")
    doctor_1 = Doctor.create(name: "Meredith Grey",
                            specialty: "General Surgery",
                            university: "Harvard University")
    doctor_2 = Doctor.create(name: "Alex Karev",
                            specialty: "Pediatric Surgery",
                            university: "Johns Hopkins University")

    hospital_1.doctors << doctor_1
    hospital_1.doctors << doctor_2

    visit doctor_path(doctor_1)

    expect(page).to have_content(doctor_1.name)
    expect(page).to have_content(doctor_1.specialty)
    expect(page).to have_content(doctor_1.university)
    expect(page).to have_content(hospital_1.name)
    expect(page).to_not have_content(doctor_2.name)
  end

  it "can see the names of all patients this doctor has" do
    hospital_1 = Hospital.create(name: "Seattle Grace Hospital")
    doctor_1 = Doctor.create(name: "Meredith Grey",
                            specialty: "General Surgery",
                            university: "Harvard University")
    doctor_2 = Doctor.create(name: "Alex Karev",
                            specialty: "Pediatric Surgery",
                            university: "Johns Hopkins University")
    patient_1 = Patient.create(name: "Katie Bryce",
                              age: 24)
    patient_2 = Patient.create(name: "Denny Duquette",
                              age: 39)
    patient_3 = Patient.create(name: "Rebecca Pope",
                              age: 32)

    hospital_1.doctors << doctor_1
    hospital_1.doctors << doctor_2
    doctor_1.patients << patient_1
    doctor_1.patients << patient_2
    doctor_2.patients << patient_3

    visit doctor_path(doctor_1)

    expect(page).to have_content(patient_1.name)
    expect(page).to have_content(patient_2.name)
    expect(page).to_not have_content(patient_3.name)
  end
end

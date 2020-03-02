require 'rails_helper'

RSpec.describe "Patient Index Page" do
  it "can see all patients" do
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
    doctor_1.patients << patient_3

    visit patients_path

    expect(page).to have_content("Denny Duquette Rebecca Pope Katie Bryce")
  end
end

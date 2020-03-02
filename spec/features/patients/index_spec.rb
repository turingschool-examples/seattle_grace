require 'rails_helper'

RSpec.describe "Patients index page", type: :feature do
  it "I can see patients listed from oldest to youngest" do
    hospital_1 = Hospital.create(name: "Seattle Grace")
    hospital_2 = Hospital.create(name: "Sacred Heart")
    doctor_1 = hospital_1.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard")
    doctor_2 = hospital_1.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins")
    doctor_3 = hospital_2.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford")
    patient_1 = doctor_1.patients.create(name: "Katie Bryce", age: "24")
    patient_2 = doctor_1.patients.create(name: "Denny Duquette", age: "22")
    patient_3 = doctor_2.patients.create(name: "Danny DeVito", age: "56")


    visit "/patients"

    save_and_open_page


    page.body.index(patient_3.name).should < page.body.index(patient_1.name)
    page.body.index(patient_1.name).should < page.body.index(patient_2.name)
  end
end

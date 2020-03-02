require 'rails_helper'

RSpec.describe "Doctors show page", type: :feature do
  it "I can see all doctors attributes" do
    hospital_1 = Hospital.create(name: "Seattle Grace")
    hospital_2 = Hospital.create(name: "Sacred Heart")
    doctor_1 = hospital_1.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard")
    doctor_2 = hospital_1.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins")
    doctor_3 = hospital_2.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford")
    patient_1 = doctor_1.patients.create(name: "Katie Bryce", age: "24")
    patient_2 = doctor_1.patients.create(name: "Denny Duquette", age: "39")
    patient_3 = doctor_2.patients.create(name: "Danny DeVito", age: "56")


    visit "/doctors/#{doctor_1.id}"

    expect(page).to have_content(doctor_1.name)
    expect(page).to have_content(doctor_1.specialty)
    expect(page).to have_content(doctor_1.university)
    expect(page).to have_content(hospital_1.name)
    expect(page).to have_content(doctor_1.name)
    expect(page).to have_content(patient_1.name)
    expect(page).to have_content(patient_2.name)
    expect(page).to_not have_content(patient_3.name)
    expect(page).to_not have_content(doctor_2.name)
    expect(page).to_not have_content(doctor_2.specialty)
    expect(page).to_not have_content(doctor_2.university)
    expect(page).to_not have_content(hospital_2.name)
  end
end


# I see all of that doctor's information including:
#   - name
#   - specialty
#   - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has

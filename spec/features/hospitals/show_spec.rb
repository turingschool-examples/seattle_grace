require 'rails_helper'

RSpec.describe "Patients index page", type: :feature do
  it "I can see patients listed from oldest to youngest" do
    hospital_1 = Hospital.create(name: "Seattle Grace")
    hospital_2 = Hospital.create(name: "Sacred Heart")
    doctor_1 = hospital_1.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard")
    doctor_2 = hospital_1.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins")
    doctor_3 = hospital_1.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", university: "Harvard")
    doctor_4 = hospital_2.doctors.create(name: "Gregg", specialty: "General Surgery", university: "Stanford")
    patient_1 = doctor_1.patients.create(name: "Katie Bryce", age: "24")
    patient_2 = doctor_1.patients.create(name: "Denny Duquette", age: "22")
    patient_3 = doctor_2.patients.create(name: "Danny DeVito", age: "56")


    visit "/hospitals/#{hospital_1.id}"

    expect(page).to have_content(hospital_1.name)
    expect(page).to have_content("Number of Doctors: 2")
    expect(page).to have_content(doctor_1.university, count: 1)
    expect(page).to have_content(doctor_2.university, count: 1)
  end
end

# When I visit a hospital's show page
# I see the hospital's name
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended

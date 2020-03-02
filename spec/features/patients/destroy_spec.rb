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


    visit "/doctors/#{doctor_1.id}"

    within "#patient-#{patient_1.id}" do
      expect(page).to have_content(patient_1.name)
      expect(page).to have_button("Delete Patient")
      click_on("Delete Patient")
    end
    expect(current_path).to eq("/doctors/#{doctor_1.id}")
    expect(page).to_not have_content(patient_1.name)
  end
end

# User Story 4, Remove a Patient from a Doctor
# ​
# As a visitor
# When I visit a Doctor's show page
# Next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed

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


    visit '/doctors/'


  end
end

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

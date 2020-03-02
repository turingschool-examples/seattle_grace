require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "when I visit the patient index page" do
    it "I see patients listed from oldest to youngest" do
      hospital1 = Hospital.create!({name: "Cleveland Clinic"})
      hospital2 = Hospital.create!({name: "Johns Hopkins"})
      hospital3 = Hospital.create!({name: "Wexner Medical"})

      doctor1 = Doctor.create!({
        name: "Alan Dreamy",
        specialty: "Podiatry",
        university: "Yale",
        hospital_id: hospital1.id
        })

      doctor2 = Doctor.create!({
        name: "Dr. Hawking",
        specialty: "Quadripeligics",
        university: "Oxford",
        hospital_id: hospital2.id
        })

      patient1 = Patient.create!({
        name: "Ricky",
        age: 10
        })

      patient2 = Patient.create!({
        name: "Lola",
        age: 21
        })
      patient3 = Patient.create!({
        name: "Jan",
        age: 30
        })
      patient4 = Patient.create!({
        name: "Mike",
        age: 35
        })
      patient5 = Patient.create!({
        name: "Becca",
        age: 52
        })

      hospital1.doctors << [doctor1]
      hospital2.doctors << [doctor2]

      doctor1.patients << [patient1, patient2, patient5]
      doctor2.patients << [patient3, patient4]

      visit '/patients'

      expect(page).to have_content("All Patients Listed from Oldest to Youngest:")
      expect(page).to have_content(patient1.name)
      expect(page).to have_content(patient1.age)
      expect(page).to have_content(patient2.name)
      expect(page).to have_content(patient2.age)
      expect(page).to have_content(patient3.name)
      expect(page).to have_content(patient3.age)
      expect(page).to have_content(patient4.name)
      expect(page).to have_content(patient4.age)
      expect(page).to have_content(patient5.name)
      expect(page).to have_content(patient5.age)
    end
  end
end

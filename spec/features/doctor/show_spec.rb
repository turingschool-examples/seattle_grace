require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "when I visit a doctors show page" do
    it "I see doctors information and name of hospital and patients" do
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

      hospital1.doctors << [doctor1]
      hospital2.doctors << [doctor2]

      doctor1.patients << [patient1, patient2]
      doctor2.patients << [patient3, patient4]

      visit "/doctors/#{doctor1.id}"

      expect(page).to have_content(doctor1.name)
      expect(page).to have_content(doctor1.specialty)
      expect(page).to have_content(doctor1.university)
      expect(page).to have_content(hospital1.name)
      expect(page).to have_content("Lola")
      expect(page).to have_content("Ricky")
    end
  end
end

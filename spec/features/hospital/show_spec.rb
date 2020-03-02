require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit a hospitals show page" do
    before(:each) do
      @hospital1 = Hospital.create!({name: "Cleveland Clinic"})
      @hospital2 = Hospital.create!({name: "Johns Hopkins"})
      @hospital3 = Hospital.create!({name: "Wexner Medical"})

      @doctor1 = Doctor.create!({
        name: "Alan Dreamy",
        specialty: "Podiatry",
        university: "Yale",
        hospital_id: @hospital1.id
        })

      @doctor2 = Doctor.create!({
        name: "Dr. Hawking",
        specialty: "Quadripeligics",
        university: "Oxford",
        hospital_id: @hospital2.id
        })

      @doctor3 = Doctor.create({
        name: "Chance Benner",
        specialty: "Internal Medicine",
        university: "Ohio University",
        hospital_id: @hospital1.id
        })

      @doctor4 = Doctor.create({
        name: "Gabriel Wohl",
        specialty: "Nutrition",
        university: "Case Western",
        hospital_id: @hospital3.id
        })

      @doctor5 = Doctor.create({
        name: "Steve",
        specialty: "Osteopathy",
        university: "Case Western",
        hospital_id: @hospital2.id
        })
      @doctor6 = Doctor.create({
        name: "Dr. Strangelove",
        specialty: "Alchemy",
        university: "The Citadel",
        hospital_id: @hospital3.id
        })

        @hospital1.doctors << [@doctor1, @doctor3]
        @hospital2.doctors << [@doctor2, @doctor5]
        @hospital3.doctors << [@doctor4, @doctor6]
    end
    it "I see the hospitals name, doctors and universities at the hospital" do
      visit "/hospitals/#{@hospital1.id}"

      expect(page).to have_content(@hospital1.name)
      expect(page).to have_content("Number of Doctors at Hospital: 2")
      expect(page).to have_content("Great Universities Attended by Our Doctors:")
      expect(page).to have_content(@doctor1.university)
      expect(page).to have_content(@doctor3.university)
    end
  end
end

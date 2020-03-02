require 'rails_helper'

RSpec.describe "As a visitor " , type: :feature do 

  describe "When I visit a doctor's show page" do 

    before(:each) do 
      @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @hospital2 = Hospital.create!(name: "Pacific Northwest General Hospital")
      @hospital3 = Hospital.create!(name: "New York Hospital")

      @doctor1 = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @doctor2 = @hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
      @doctor3 = @hospital2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      @doctor4 = @hospital3.doctors.create!(name: "Derek Webber", specialty: "Attending Surgeon", university: "University of Pennsylvania")
      
      @patient1  = @doctor1.patients.create!(name: "Katie Bryce", age: 24)
      @patient2  = @doctor2.patients.create!(name: "Denny Duquette", age: 39)
      @patient3  = @doctor1.patients.create!(name: "Rebecca Pope", age: 32)
      @patient4  = @doctor1.patients.create!(name: "Zola Shepherd", age: 2)
    end

    it "I see all the doctor's information" do 

      visit "/doctors/#{@doctor1.id}"

      expect(page).to have_content("Name: #{@doctor1.name}")
      expect(page).to have_content("Specialty: #{@doctor1.specialty}")
      expect(page).to have_content("University: #{@doctor1.university}")
      expect(page).to have_content("Hospital: #{@doctor1.hospital.name}")

      expect(page).to_not have_content("Name: #{@doctor2.name}")
      expect(page).to_not have_content("Name: #{@doctor3.name}")
      expect(page).to_not have_content("Name: #{@doctor4.name}")
      expect(page).to have_content("Patients: #{@patient1.name}, #{@patient3.name}, #{@patient4.name},")
      expect(page).to_not have_content(@patient2.name)

    end

    it "I can delete a patient from the doctor's caseload" do 
      
      visit "/doctors/#{@doctor1.id}"

      within("div#patient-#{@patient3.id}") do 
        expect(page).to have_content(@patient3.name)
      end

      within("div#patient-#{@patient1.id}") do 
        click_link("Delete")
      end

      expect(current_path).to eq("/doctors/#{@doctor1.id}")
      expect(page).to_not have_content(@patient1.name)

      visit "/patients"
      expect(page).to have_content(@patient1.name)

    end

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

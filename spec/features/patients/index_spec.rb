require 'rails_helper'

RSpec.describe "As a visitor " , type: :feature do 

  describe "When I visit a patient's index page" do 

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

    it "I see a list of patients from youngest to oldest" do
      
      visit "/patients"
      expect(page).to have_content("Denny Duquette, Rebecca Pope, Katie Bryce, Zola Shepherd")
    end

  end

end
require 'rails_helper'

RSpec.describe "As a visitor" , type: :feature do 

  describe "When I visit the hospital show page" do 

    before(:each) do 
      @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @hospital2 = Hospital.create!(name: "Pacific Northwest General Hospital")
      @hospital3 = Hospital.create!(name: "New York Hospital")

      @doctor1 = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @doctor2 = @hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
      @doctor3 = @hospital1.doctors.create!(name: "George Costanza", specialty: "Colorectal Surgery", university: "Johns Hopkins University")
      @doctor4 = @hospital2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    end

    it "I see the hospital info including name, number of doctors, list of universities" do 

      visit "/hospitals/#{@hospital1.id}"

      expect(page).to have_content(@hospital1.name)
      expect(page).to have_content("Number of doctors: 3")
      expect(page).to have_content("Universities attended: Harvard University, Johns Hopkins University")
      expect(page).to_not have_content("Stanford University")

    end

  end

end
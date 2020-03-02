require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit a doctor show page' do
    before :each do
      @grey = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @meredith = @grey.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @katie = @meredith.patients.create!(name:"Katie Bryce", age: 24)
      @denny = @meredith.patients.create!(name:"Denny Duquette", age: 39)
      
      visit "/doctors/#{@meredith.id}"
    end
    
    it "I see that doctors information" do
      expect(page).to have_content("Doctor: #{@meredith.name}")
      expect(page).to have_content("Specialty: #{@meredith.specialty}")
      expect(page).to have_content("Education: #{@meredith.university}")
      expect(page).to have_content("Hospital: #{@meredith.hospital.name}")
      
      within ("#patients") do
        expect(page).to have_content("Patients:")
        expect(page).to have_content("#{@katie.name}")
        expect(page).to have_content("#{@denny.name}")
      end
      save_and_open_page
    end
  end
end
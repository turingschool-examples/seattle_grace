require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the patient index page' do
    before :each do
      @grey = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @meredith = @grey.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      
      @katie = @meredith.patients.create!(name:"Katie Bryce", age: 24)
      @denny = @meredith.patients.create!(name:"Denny Duquette", age: 39)
      @rebecca = @meredith.patients.create!(name:"Rebecca Pope", age: 32)
      @zola = @meredith.patients.create!(name:"Zola Shepherd", age: 2)
      
      visit "/patients"
    end
    
    it "I see the names of all patients listed from oldest to youngest" do
      expect(page).to have_content("Patients (oldest to youngest):")
      
      within ("#patients") do
        expect(page).to have_content("#{@denny.name}: #{@denny.age}")
        expect(page).to have_content("#{@rebecca.name}: #{@rebecca.age}")
        expect(page).to have_content("#{@katie.name}: #{@katie.age}")
        expect(page).to have_content("#{@zola.name}: #{@zola.age}")
      end
    end
  end
end
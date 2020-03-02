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
        denny_info = "#{@denny.name}: #{@denny.age}"
        rebecca_info = "#{@rebecca.name}: #{@rebecca.age}"
        katie_info = "#{@katie.name}: #{@katie.age}"
        zola_info = "#{@zola.name}: #{@zola.age}"
        
        expect(denny_info).to appear_before(rebecca_info)
        expect(rebecca_info).to appear_before(katie_info)
        expect(katie_info).to appear_before(zola_info)
      end
    end
  end
end
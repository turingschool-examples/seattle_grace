require 'rails_helper'

describe "As a Visitor" do
  before :each do 
  @patient_1 = Patient.create!(name: "Liz", age: 25)
  @patient_3 = Patient.create!(name: "Josh", age: 32)
  @patient_4 = Patient.create!(name: "Danny", age: 26)
  @patient_5 = Patient.create!(name: "Alyssa", age: 30)
  @patient_2 = Patient.create!(name: "Claudia", age: 34)
  @patient_6 = Patient.create!(name: "Elizabeth", age: 25)
  end 
  describe "When I visit the patient index page" do
    it "I see the names of all patients listed from oldest to youngest" do 
      visit "/patients/"

      expect(page).to have_content(@patient_1.name)  
      expect(page).to have_content(@patient_1.age)  
    end
  end
end


# User Story 2, Patient Index Page
# ​
# As a visitor
# When I visit the patient index page
# I see the names of all patients listed from oldest to youngest

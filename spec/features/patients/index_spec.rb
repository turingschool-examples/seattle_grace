require "rails_helper"

RSpec.describe "on the index page", type: :feature do
  describe "as a visitor" do
    it "can see the name of all patients listed youngest to oldest" do
      patient_1 = Patient.create(name: "Katie Bryce", age: "24")
      patient_2 = Patient.create(name: "Denny Duquette", age: "39")
      patient_3 = Patient.create(name: "Rebecca Pope", age: "32")
      patient_4 = Patient.create(name: "Zola Shepherd", age: "2")

      visit "/patients"

      expect(page).to have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)
      expect(page).to have_content(patient_3.name)
      expect(page).to have_content(patient_4.name)
      expect(Patient.sort_by_age).to eq([patient_2, patient_3, patient_1, patient_4])
    end
  end
end
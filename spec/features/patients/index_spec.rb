require 'rails_helper'

RSpec.describe "Patient Index Page" do
    it "can see all the patients in the system listed from oldest to youngest" do
    Patient.destroy_all

    patient_1 = Patient.create!(
        name: "Katie Bryce",
        age: 24,
      )

    patient_2 = Patient.create!(
        name: "Denny Smith",
        age: 39,
      )

    patient_3 = Patient.create!(
        name: "Rebecca Pope",
        age: 25,
      )

    patient_4 = Patient.create!(
        name: "Zola Sheperd",
        age: 2,
      )

      visit '/patients'

      expect(page).to have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)
      expect(page).to have_content(patient_3.name)
      expect(page).to have_content(patient_4.name)
    end
end

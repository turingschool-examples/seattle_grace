require 'rails_helper'

RSpec.describe "As a visitor" do
  before :each do
    @grey_hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")
    @meredith = @grey_hospital.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")

    @abby = @meredith.patients.create(name: "Abby Gallant", age: 32)
    @brooke = @meredith.patients.create(name: "Brooke Webb", age: 33)
    @kayla = @meredith.patients.create(name: "Kayla Clark", age: 34)

    @patients = @meredith.patients

    visit "/patients"
  end

  it "shows the patients on the index page from oldest to youngest" do

    within"#patient-#{@abby.id}" do
      expect(page).to have_content(@abby.name)
    end

    within"#patient-#{@brooke.id}" do
      expect(page).to have_content(@brooke.name)
    end

    within"#patient-#{@kayla.id}" do
      expect(page).to have_content(@kayla.name)
    end
    expect(@patients.order_by_age_from_oldest.first).to eq(@kayla)
    expect(@patients.order_by_age_from_oldest.last).to eq(@abby)
  end
end

# User Story 2, Patient Index Page
# ​
# As a visitor
# When I visit the patient index page
# I see the names of all patients listed from oldest to youngest

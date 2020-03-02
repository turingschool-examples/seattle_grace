require 'rails_helper'

RSpec.describe "As a visitor" do
  before :each do
    @grey_hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")

    @meredith = @grey_hospital.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @alex = @grey_hospital.doctors.create(name: "Alex Gallant", specialty: "General Surgery", university: "Harvard University")
    @shane = @grey_hospital.doctors.create(name: "Shane Walton", specialty: "General Surgery", university: "University of Maine")
    @gordon = @grey_hospital.doctors.create(name: "Gordon Webb", specialty: "General Surgery", university: "Duke University")

    visit "/hospitals/#{@grey_hospital.id}"
  end

  it "shows the hospital's name and basic doctor information" do
    expect(page).to have_content(@grey_hospital.name)
    expect(page).to have_content("Number of Doctors: 4")

    expect(page).to have_content("Harvard University")
    expect(page).to have_content("University of Maine")
    expect(page).to have_content("Duke University")

    expect(@grey_hospital.doctors.unique_education.count).to eq(3)
  end
end

# User Story 3, Hospital Show Page
# ​
# As a visitor
# When I visit a hospital's show page
# I see the hospital's name
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended

require 'rails_helper'

RSpec.describe "As a visitor" do
  before :each do
    @grey_hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")

    @meredith = @grey_hospital.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    
    @alex = @meredith.patients.create(name: "Alex Gallant", age: 31)
    @shane = @meredith.patients.create(name: "Shane Walton", age: 29)
    @gordon = @meredith.patients.create(name: "Gordon Webb", age: 30)

    visit "/doctors/#{@meredith.id}"
  end

  it "shows the doctor's information and a list of their patients" do
    expect(page).to have_content(@meredith.name)
    expect(page).to have_content(@meredith.specialty)
    expect(page).to have_content(@meredith.university)
    expect(page).to have_content(@grey_hospital.name)

    within"#patient-#{@alex.id}" do
      expect(page).to have_content(@alex.name)
    end

    within"#patient-#{@shane.id}" do
      expect(page).to have_content(@shane.name)
    end

    within"#patient-#{@gordon.id}" do
      expect(page).to have_content(@gordon.name)
    end
  end
end

# User Story 1, Doctors Show Page
# ​
# As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#   - name
#   - specialty
#   - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has

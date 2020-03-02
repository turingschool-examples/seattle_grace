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
      expect(page).to have_link "Remove"
    end

    within"#patient-#{@shane.id}" do
      expect(page).to have_content(@shane.name)
      expect(page).to have_link "Remove"
    end

    within"#patient-#{@gordon.id}" do
      expect(page).to have_content(@gordon.name)
      expect(page).to have_link "Remove"
    end
  end

  it "has a button to delete a patient from a doctor's caseload" do

    within"#patient-#{@alex.id}" do
      click_link "Remove"
    end

    expect(current_path).to eq("/doctors/#{@meredith.id}")
    expect(page).to_not have_content(@alex.name)
    expect(page).to have_content(@shane.name)
    expect(page).to have_content(@gordon.name)
  end
end

# User Story 4, Remove a Patient from a Doctor
# ​
# As a visitor
# When I visit a Doctor's show page
# Next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed

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

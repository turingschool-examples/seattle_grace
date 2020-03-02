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

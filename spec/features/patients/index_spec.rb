require 'rails_helper'

RSpec.describe "patients index page", type: :feature do
  before(:each) do
    @hospital1 = Hospital.create(name: "Seattle Grace")
    @hospital2 = Hospital.create(name: "New York Hospital")

    @doctor1 = @hospital1.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @doctor2 = @hospital1.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    @doctor3 = @hospital2.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doctor4 = @hospital2.doctors.create(name: "Derek Webber", specialty: "Attending Surgeon", university: "University of Pennsylvania")

    @patient1 = @doctor1.patients.create(name: "Katie Bryce", age: 24)
    @patient2 = @doctor1.patients.create(name: "Denny Duquette", age: 39)
    @patient3 = @doctor2.patients.create(name: "Rebecca Pope", age: 32)
    @patient4 = @doctor2.patients.create(name: "Zola Shepherd", age: 2)
  end

  scenario "list of all patients from oldest to youngest" do
    visit "/patients"

    expect("Denny Duquette").to appear_before("Rebecca Pope")
    expect("Rebecca Pope").to appear_before("Katie Bryce")
    expect("Katie Bryce").to appear_before("Zola Shepherd")
    expect(page).to have_content("Denny Duquette")
    expect(page).to have_content("Age: 39")
    expect(page).to have_content("Rebecca Pope")
    expect(page).to have_content("Age: 32")
    expect(page).to have_content("Katie Bryce")
    expect(page).to have_content("Age: 24")
    expect(page).to have_content("Zola Shepherd")
    expect(page).to have_content("Age: 2")
  end


end

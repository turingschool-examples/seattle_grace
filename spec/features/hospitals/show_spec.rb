require 'rails_helper'

RSpec.describe "hospital show page", type: :feature do
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

  scenario "see name, and count of doctors" do
    visit "/hospitals/#{@hospital2.id}"

    expect(page).to have_content(@hospital2.name)
    expect(page).to have_content("Number of Doctors: 2")
  end

  scenario "see list of universities attended by doctors" do
    visit "/hospitals/#{@hospital2.id}"

    expect(page).to have_content("Stanford University")
    expect(page).to have_content("University of Pennsylvania")
  end

end

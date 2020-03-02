require 'rails_helper'

describe 'As a visitor on the hospital show page' do
  before :each do
    @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")

    @doctor_1 = @hospital.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @doctor_2 = @hospital.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")

    @patient_1 = @doctor_1.patients.create(name: "Katie Bryce", age: 24)
    @patient_2 = @doctor_1.patients.create(name: "Denny Duquette", age: 39)

    visit "/hospitals/#{@hospital.id}"
  end

  it "I see the hospital name" do
    expect(page).to have_content("#{@hospital.name}")
  end

  it "I see the number od doctors at this hospital" do
    expect(page).to have_content("Number of doctors: 2")
  end

  it "I see a list of all univiersities the doctors have attended" do
    expect(page).to have_content("#{@doctor_1.university}")
    expect(page).to have_content("#{@doctor_2.university}")
  end

end

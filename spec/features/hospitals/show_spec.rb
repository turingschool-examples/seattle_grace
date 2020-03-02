require 'rails_helper'

RSpec.describe 'Doctor Show Page', type: :feature do
  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name: "New York Hospital")
    @doctor_1 = @hospital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @doctor_2 = @hospital.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    @doctor_3 = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doctor_4 = @hospital2.doctors.create!(name: "Derek Webber", specialty: "Attending Surgeon", university: "University of Pennsylvania")

    # Additional Doctor with same university to test uniqiness
    @doctor_5 = @hospital.doctors.create!(name: "Miranda Bailey Clone", specialty: "General Surgery", university: "Stanford University")

    @patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
    @patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
    @patient_3 = Patient.create!(name: "Rebecca Page", age: 32)
    @patient_4 = Patient.create!(name: "Zola Shephard", age: 2)

    DoctorPatient.create!(doctor: @doctor_1, patient: @patient_1)
    DoctorPatient.create!(doctor: @doctor_1, patient: @patient_3)
  end

  it "should show the number of doctors here and a unique list of universities of its doctors" do
    visit "/hospitals/#{@hospital.id}"

    expect(page).to have_content("Grey Sloan Memorial Hospital")
    expect(page).to have_content("Number of Doctors: 4")
    expect(page).to have_content("Doctor Universities:")
    expect(page).to have_content("Harvard University")
    expect(page).to have_content("Johns Hopkins University")
    # Count 1 to test uniqiness of Universities
    expect(page).to have_content("Stanford University", count: 1)

    expect(page).not_to have_content("University of Pennsylvania")
  end
end
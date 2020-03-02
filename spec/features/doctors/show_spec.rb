require 'rails_helper'

RSpec.describe 'Doctor Show Page', type: :feature do
  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name: "New York Hospital")
    @doctor_1 = @hospital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @doctor_2 = @hospital.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    @doctor_3 = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doctor_4 = @hospital2.doctors.create!(name: "Derek Webber", specialty: "Attending Surgeon", university: "University of Pennsylvania")

    @patient_1 = Patient.create!(name: "Katie Bryce", age: 24)
    @patient_2 = Patient.create!(name: "Denny Duquette", age: 39)
    @patient_3 = Patient.create!(name: "Rebecca Page", age: 32)
    @patient_4 = Patient.create!(name: "Zola Shephard", age: 2)

    DoctorPatient.create!(doctor: @doctor_1, patient: @patient_1)
    DoctorPatient.create!(doctor: @doctor_1, patient: @patient_3)
    DoctorPatient.create!(doctor: @doctor_2, patient: @patient_3)
  end

  it 'should show name, specialty, university, hospital employeed at, and all patients for this doctor' do
    visit "/doctors/#{@doctor_1.id}"

    expect(page).to have_content("Name: Meredith Grey")
    expect(page).to have_content("Specialty: General Surgery")
    expect(page).to have_content("University: Harvard University")
    expect(page).to have_content("Practices at Grey Sloan Memorial Hospital")

    within "#patients-#{@patient_1.id}" do
      expect(page).to have_content("Katie Bryce")
    end
      

    within "#patients-#{@patient_3.id}" do
      expect(page).to have_content("Rebecca Page")
    end

    expect(page).not_to have_content("Denny Duquette")
    expect(page).not_to have_content("Zola Shephard")
  end

  it 'should show a remove patient button next to each patient' do
    visit "/doctors/#{@doctor_1.id}"


    within "#patients-#{@patient_1.id}" do
      expect(page).to have_content("Katie Bryce")
      expect(page).to have_link("Remove Patient")
    end

    within "#patients-#{@patient_3.id}" do
      click_on "Remove Patient"
    end

    expect(current_path).to eq("/doctors/#{@doctor_1.id}")
    expect(page).not_to have_content("Denny Duquette")
    expect(page).not_to have_content("Zola Shephard")
    expect(page).not_to have_content("Rebecca Page")

    ## Additional Test to visit a different doctor to make sure their patient association wasn't removed as well

    visit "/doctors/#{@doctor_2.id}"

    within "#patients-#{@patient_3.id}" do
      expect(page).to have_content("Rebecca Page")
    end
  end
end
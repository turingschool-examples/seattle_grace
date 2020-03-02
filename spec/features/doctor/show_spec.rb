require 'rails_helper'

describe 'As a visitor on the doctor show page' do
  before :each do
    @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")

    @doctor = @hospital.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")

    @patient_1 = @doctor.patients.create(name: "Katie Bryce", age: 24)
    @patient_2 = @doctor.patients.create(name: "Denny Duquette", age: 39)

    visit "/doctors/#{@doctor.id}"
  end

  it "I see the doctor info" do
    expect(page).to have_content("Doctor Info")
    expect(page).to have_content("Name: #{@doctor.name}")
    expect(page).to have_content("Specialty: #{@doctor.specialty}")
    expect(page).to have_content("Education: #{@doctor.university}")
    expect(page).to have_content("Hospital: #{@doctor.hospital.name}")
    expect(page).to have_content("Patients:")
    expect(page).to have_content("#{@patient_1.name}")
    expect(page).to have_content("#{@patient_2.name}")
  end

  it "I can delete a patient from that doctor" do
    within("#patient#{@patient_1.id}") do
      click_button 'Remove patient from caseload'
    end

    expect(current_path).to eq("/doctors/#{@doctor.id}")
    expect(page).to_not have_content("Katie Bryce")
  end

end

require 'rails_helper'

RSpec.describe 'When I visit a doctors show page' do
  it "sees doctors information, hospital they work at, and all patients" do
    seattle_grace = Hospital.create(name: 'Seattle Grace Hospital')
    katie = Patient.create(name: 'Katie Bryce', age: 24)
    denny = Patient.create(name: 'Denny Duquette', age: 39)

    meredith = Doctor.create(name: 'Meredith Grey',
                             specialty: 'General Surgery',
                             university: 'Harvard University',
                             hospital: seattle_grace,
                             patients: [denny, katie])

    visit "/doctors/#{meredith.id}"

    expect(page).to have_content("#{meredith.name}")
    expect(page).to have_content("Specialty: #{meredith.specialty}")
    expect(page).to have_content("Education: #{meredith.university}")
    expect(page).to have_content("Hospital: #{meredith.hospital.name}")
    expect(page).to have_content("Patients:")
    expect(page).to have_content("#{denny.name}")
    expect(page).to have_content("#{katie.name}")

    within("#patient-#{denny.id}") do
      expect(page).to have_content("#{denny.name}")
      click_on("Remove Patient")
      expect(current_path).to eq("/doctors/#{meredith.id}")
    end

    expect(page).to_not have_content("#{denny.name}")
    expect(page).to have_content("#{katie.name}")
  end
end

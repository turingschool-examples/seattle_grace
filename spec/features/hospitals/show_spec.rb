require 'rails_helper'

RSpec.describe 'Hospitals show page' do
  it 'When I visit the hospitals show page I see the following info' do
    hospital1 = Hospital.create!(name: "Sacred Heart")
    hospital2 = Hospital.create!(name: "Pacific Northwest General Hospital")

    doctor1 = Doctor.create!(name: "Turk", specialty: "Surgery", university: "Harvard University", hospital: hospital1)
    doctor2 = Doctor.create!(name: "Carla", specialty: "Nursing", university: "New Jersey University", hospital: hospital2)
    doctor3 = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital: hospital1)
    doctor4 = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University", hospital: hospital1)

    visit "hospitals/#{hospital1.id}"

    expect(page).to have_content('Sacred Heart')
    expect(page).to have_content('3 Doctors')
    expect(page).to have_content('Harvard University', count: 1)
    expect(page).to have_content('Johns Hopkins University', count: 1)

    expect(page).to_not have_content('Pacific Northwest General Hospital')
    expect(page).to_not have_content('New Jersey University')
  end
end

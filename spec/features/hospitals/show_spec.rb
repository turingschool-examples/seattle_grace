require 'rails_helper'

RSpec.describe 'When I visit a hospital show page' do
  it "sees hospital name, number of docs work there, and unique docs universities" do
    seattle_grace = Hospital.create(name: 'Seattle Grace Hospital')
    katie = Patient.create(name: 'Katie Bryce', age: 24)
    denny = Patient.create(name: 'Denny Duquette', age: 39)

    meredith = Doctor.create(name: 'Meredith Grey',
                             specialty: 'General Surgery',
                             university: 'Harvard University',
                             hospital: seattle_grace,
                             patients: [denny, katie])

    karev = Doctor.create(name: 'Alex Karev',
                             specialty: 'Pediatric Surgery',
                             university: 'Johns Hopkins University',
                             hospital: seattle_grace,
                             patients: [denny, katie])

    miranda = Doctor.create(name: 'Miranda Bailey',
                             specialty: 'General Surgery',
                             university: 'Stanford University',
                             hospital: seattle_grace,
                             patients: [denny, katie])

    derek = Doctor.create(name: 'Derek Webber',
                             specialty: 'Attending Surgeon',
                             university: 'University of Pennsylvania',
                             hospital: seattle_grace,
                             patients: [denny, katie])

    christina = Doctor.create(name: 'Christina Yang',
                            specialty: 'Cardiothoracic Surgery',
                            university: 'Stanford University',
                            hospital: seattle_grace,
                            patients: [denny, katie])

    visit "/hospitals/#{seattle_grace.id}"

    expect(page).to have_content("#{seattle_grace.name}")
    expect(page).to have_content("Number of Doctors: #{seattle_grace.doctors.length}")
    expect(page).to have_content("Doctors Educated at: #{meredith.university}, #{karev.university}, #{miranda.university}, and #{derek.university}")

  end
end

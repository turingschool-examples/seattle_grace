require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'on doctor show page' do
    it 'allows me to remove patient from doctor' do
      hospital1 = Hospital.create!(name: 'Hospital in Denver')
      doctor1 = hospital1.doctors.create!(name: 'John', specialty: 'Surgeon', university: 'Harvard')
      patient1 = doctor1.patients.create!(name: 'Christian', age: 28)
      patient2 = doctor1.patients.create!(name: 'Tanner', age: 26)

      visit "/doctors/#{doctor1.id}"
      expect(page).to have_content('John')
      expect(page).to have_content('Christian')
      expect(page).to have_content('Tanner')

      click_on 'Remove Tanner'
      expect(current_path).to eq("/doctors/#{doctor1.id}")
      expect(page).to have_content('Christian')
      expect(page).to_not have_content('Tanner')
    end
  end
end


  # User Story 4, Remove a Patient from a Doctor
  # ​
  # As a visitor
  # When I visit a Doctor's show page
  # Next to each patient's name, I see a button to remove that patient from that doctor's caseload
  # When I click that button for one patient
  # I'm brought back to the Doctor's show page
  # And I no longer see that patient's name listed
  #

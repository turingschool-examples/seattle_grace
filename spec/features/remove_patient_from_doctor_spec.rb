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

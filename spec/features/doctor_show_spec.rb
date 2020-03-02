require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when on doctors show page' do
    it 'shows all relevant doctor info' do
      hospital1 = Hospital.create!(name: 'Hospital in Denver')
      hospital2 = Hospital.create!(name: 'Hospital in Boulder')
      doctor1 = hospital1.doctors.create!(name: 'John', specialty: 'Surgeon', university: 'Harvard')
      doctor2 = hospital2.doctors.create!(name: 'Steve', specialty: 'Adults', university: 'Yale')
      patient1 = doctor1.patients.create!(name: 'Christian', age: 28)
      patient2 = doctor1.patients.create!(name: 'Tanner', age: 26)
      patient3 = doctor2.patients.create!(name: 'Megan', age: 22)

      visit "/doctors/#{doctor1.id}"
      expect(page).to have_content('John')
      expect(page).to have_content('Surgeon')
      expect(page).to have_content('Harvard')
      expect(page).to have_content('Hospital in Denver')
      expect(page).to have_content('Christian')
      expect(page).to have_content('Tanner')
      expect(page).to_not have_content('Megan')
      expect(page).to_not have_content('Steve')
      expect(page).to_not have_content('Hospital in Boulder')
    end
  end
end

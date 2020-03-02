require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'On the hospital show page' do
    it 'shows all relevant hospital info' do
      hospital1 = Hospital.create!(name: 'Hospital in Denver')
      hospital2 = Hospital.create!(name: 'Hospital in Boulder')
      doctor1 = hospital1.doctors.create!(name: 'John', specialty: 'Surgeon', university: 'Harvard')
      doctor2 = hospital2.doctors.create!(name: 'Steve', specialty: 'Adults', university: 'Yale')
      doctor3 = hospital2.doctors.create!(name: 'Chris', specialty: 'Children', university: 'Yale')
      doctor4 = hospital2.doctors.create!(name: 'Larry', specialty: 'Life', university: 'Stanford')

      visit "/hospitals/#{hospital2.id}"
      save_and_open_page
      expect(page).to have_content('Hospital in Boulder')
      expect(page).to_not have_content('Hospital in Denver')
      expect(page).to_not have_content('John')
      expect(page).to_not have_content('Harvard')
      expect(page).to have_content(3)
      expect(page).to have_content('Stanford')
      expect(page).to have_content('Yale')
    end
  end
end

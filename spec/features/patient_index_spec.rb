require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when on patient index page' do
    it 'shows all relevant patient info' do
      patient1 = Patient.create!(name: 'Christian', age: 28)
      patient2 = Patient.create!(name: 'Tanner', age: 26)
      patient3 = Patient.create!(name: 'Kelly', age: 31)

      visit "/patients"
      expect(page).to have_content('Christian')
      expect(page).to have_content('Tanner')
      expect(page).to have_content('Kelly')
    end
  end
end

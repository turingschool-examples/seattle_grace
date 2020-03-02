require 'rails_helper'

RSpec.describe 'As a VISITOR' do
  before :each do
    @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')

    @doc_1 = @hospital_1.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
    @doc_2 = @hospital_1.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')

    @doc_1.patients.create!(name: 'Katie Bryce', age: 24)
    @doc_1.patients.create!(name: 'Denny Duquette', age: 39)
    @doc_2.patients.create!(name: 'Rebecca Pope', age: 32)
  end

  describe 'when I visit a PATIENT INDEX PAGE' do
    it 'can see all patients oldest to youngest' do
      visit '/patients'

      expect(page).to have_content('Katie Bryce, 24')
      expect(page).to have_content('Rebecca Pope, 32')
      expect(page).to have_content('Denny Duquette, 39')
    end
  end
end

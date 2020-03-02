require 'rails_helper'

RSpec.describe 'As a VISITOR' do
  before :each do
    @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')

    @doc_1 = @hospital_1.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
    @doc_2 = @hospital_1.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')

    @patient_1 = @doc_1.patients.create!(name: 'Katie Bryce', age: 24)
    @patient_2 = @doc_1.patients.create!(name: 'Denny Duquette', age: 39)
    @patient_3 = @doc_2.patients.create!(name: 'Rebecca Pope', age: 32)
  end

  describe 'when I visit a SHOW PAGE' do
    it 'can see doctor information' do
      visit "/doctors/#{@doc_1.id}"

      expect(page).to have_content('Meredith Grey')

      within '#doctor_info' do
        expect(page).to have_content('Specialty: General Surgery')
        expect(page).to have_content('University: Harvard University')
      end
    end

    it 'can see patient information' do
      visit "/doctors/#{@doc_1.id}"

      within '#patient_info' do
        expect(page).to have_content('Katie Bryce, 24')
        expect(page).to have_content('Denny Duquette, 39')
        expect(page).to_not have_content('Rebecca Pope, age: 32')
      end
    end

    it 'can destroy a patient from list' do
      visit "/doctors/#{@doc_1.id}"

      within "#patient-#{@patient_1.id}" do
        click_on 'Delete Patient'
      end

      expect(current_path).to eq("/doctors/#{@doc_1.id}")
      expect(page).to_not have_content('Katie Bryce, 24')
    end
  end
end

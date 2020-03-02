require 'rails_helper'

RSpec.describe 'as a VISITOR' do
  before :each do
    @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')

    @doc_1 = @hospital_1.doctors.create!( name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University' )
    @doc_2 = @hospital_1.doctors.create!( name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University' )
    @doc_3 = @hospital_1.doctors.create!( name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University' )

    @doc_1.patients.create!(name: 'Katie Bryce', age: 24 )
    @doc_1.patients.create!( name: 'Denny Duquette', age: 39 )
    @doc_2.patients.create!( name: 'Rebecca Pope', age: 32 )

    visit "/hospitals/#{@hospital_1.id}"
  end

  describe 'when I visit the hospital SHOW PAGE' do
    it 'can see hospital information' do
      expect(page).to have_content('Grey Sloan Memorial Hospital')
    end

    it 'can see the number of doctors working at this hospital' do
      within '#doctor_count' do
        expect(page).to have_content(3)
      end
    end

    it 'can see a unique list of universities that doctors have attended' do
      within '#doctor_universities' do
        expect(page).to have_content('Harvard University')
        expect(page).to have_content('Johns Hopkins University')
        expect(page).to have_content('Stanford University')
      end
    end
  end
end

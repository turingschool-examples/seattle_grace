require 'rails_helper'

RSpec.describe 'As a VISITOR' do
  before :each do
    @doc_1 = Doctor.create! { name: 'Meredith Grey', specialty: 'General Surgery', education: 'Harvard University' }
    @doc_2 = Doctor.create! { name: 'Alex Karev', specialty: 'Pediatric Surgery', education: 'Johns Hopkins University' }

    @doc_1.patients.create! { name: 'Katie Bryce', age: 24 }
    @doc_1.patients.create! { name: 'Denny Duquette', age: 39 }
    @doc_2.patients.create! { name: 'Rebecca Pope', age: 32 }

  end

  describe 'when I visit a SHOW PAGE' do
    it 'can see doctor information' do
      visit "/doctor/#{@doc_1.id}"

      within '#doctor_info' do
        expect(page).to have_content('Name: Meredith Grey')
        expect(page).to have_content('Specialty: General Surgery')
        expect(page).to have_content('Education: Harvard University')
      end
    end

    it 'can see patient information' do
      visit "/doctor/#{@doc_1.id}"

      within '#patient_info' do
        expect(page).to have_content('Katie Bryce, 24')
        expect(page).to have_content('Denny Duquette, 39')
      end
    end
  end
end

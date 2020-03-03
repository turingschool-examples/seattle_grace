require 'rails_helper'

RSpec.describe 'As a VISITOR' do
  describe 'when I visit a SURGERY SHOW PAGE' do
    before :each do
      @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')

      @doc_1 = @hospital_1.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
      @doc_2 = @hospital_1.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')

      @surgery_1 = Surgery.create!(title: 'Gallbladder Removal', day: 'Friday', operating_room: 121)
      @surgery_2 = Surgery.create!(title: 'Photorefractive Kerectonomy', day: 'Monday', operating_room: 206)
      @surgery_3 = Surgery.create!(title: 'Limb Amputation', day: 'Friday', operating_room: 56)

      @doc_1.doctor_surgeries.create!(surgery_id: @surgery_1.id, doctor_id: @doc_1.id)
      @doc_2.doctor_surgeries.create!(surgery_id: @surgery_1.id, doctor_id: @doc_2.id)
    end
    it 'can see information about a surgery' do
      visit "/surgeries/#{@surgery_1.id}"

      within '#surgery_info' do
        expect(page).to have_content('Title: Gallbladder Removal')
        expect(page).to have_content('Operating Room: 121')
        expect(page).to have_content('Doctor Count: 2')
      end

      within '#surgeries_today' do
        expect(page).to have_content('Limb Amputation')
      end
    end
  end
end

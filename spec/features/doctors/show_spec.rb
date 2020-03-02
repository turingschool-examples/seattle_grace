require 'rails_helper'

RSpec.describe 'As a User' do
  describe "Doc show page" do
    before(:each) do
	@hospital1 = Hospital.create( name: 'Grey Sloan Memorial Hospital')
	@hospital2 = Hospital.create( name: 'Pacific Northwest General Hospital')
	@doc1 = Doctor.create(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University', hospital: @hospital2)
	@doc2 = Doctor.create(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University', hospital: @hospital1)
	@patient1 = Patient.create( name: 'Katie Bryce', age: 24)
	@patient2 = Patient.create( name: 'Denny Duquette', age: 39)
	@patient3 = Patient.create( name: 'Rebecca Pope', age: 32)
	@doc1.patients << @patient1
	@doc1.patients << @patient2
	visit "/doctors/#{@doc1.id}"
    end

	it 'show doc info' do
		within "#doc" do
			expect(page).to have_content("Meredith Grey")
			expect(page).to have_content("General Surgery")
			expect(page).to have_content("Harvard University")
		end
	end

	it 'show hopital' do
		within "#hospital" do
			expect(page).to have_content("Pacific Northwest General Hospital")
		end
	end

	it 'show patients' do
		within "#patients" do
			expect(page).to have_content("Katie Bryce")
			expect(page).to have_content("Denny Duquette")
		end
	end
	
	it 'remove patient' do
		save_and_open_page
		within "#patient-#{@patient1.id}" do
			click_on "remove from caseload"
		end
		within "#patients" do
			expect(page).to_not have_content("Katie Bryce")
		end
		save_and_open_page
	end

   end
end

require 'rails_helper'
  
RSpec.describe 'As a User' do
  describe "hospital show page" do
    before(:each) do
        @hospital1 = Hospital.create( name: 'Grey Sloan Memorial Hospital')
        @hospital2 = Hospital.create( name: 'Pacific Northwest General Hospital')
        @doc1 = Doctor.create(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University', hospital: @hospital2)
        @doc2 = Doctor.create(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University', hospital: @hospital2)
        @patient1 = Patient.create( name: 'Katie Bryce', age: 24)
        @patient2 = Patient.create( name: 'Denny Duquette', age: 39)
        @patient3 = Patient.create( name: 'Rebecca Pope', age: 32)
        @doc1.patients << @patient1
        @doc1.patients << @patient2
        visit "/hospitals/#{@hospital2.id}"
    end


	it "hospital info" do
		expect(page).to have_content("Pacific Northwest General Hospital")
	end


	it "doc info" do
		within "#docs" do
			expect(page).to have_content("2")
			expect(page).to have_content("Harvard University")
			expect(page).to have_content("Johns Hopkins University")
		end
	end
  end
end


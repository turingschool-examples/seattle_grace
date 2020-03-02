require 'rails_helper'
  
RSpec.describe 'As a User' do
  describe "patient index page" do
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
        visit "/patients"
    end


	it "alphabetical patients" do
		expect(page).to have_content("Katie Bryce")
		expect(page).to have_content("Denny Duquette")
		expect(page).to have_content("Rebecca Pope")
	end

   end
end



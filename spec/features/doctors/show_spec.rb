require 'rails_helper'

RSpec.describe 'As a User' do
  describe "Doc show page" do
    before(:each) do
	@doc1 = Doctor.create(name: 'Meredith Grey', specialty: 'General Surgery',education: 'Harvard University')
	@doc2 = Doctor.create(name: 'Alex Karev', specialty: 'Pediatric Surgery', education: 'Johns Hopkins University')
	@hospital1 = Hospital.create( name: 'Grey Sloan Memorial Hospital')
	@hospital2 = Hospital.create( name: 'Pacific Northwest General Hospital')
	@patient1 = Patient.create( name: 'Katie Bryce', age: 24)
	@patient2 = Patient.create( name: 'Denny Duquette', age: 39)
	@patient3 = Patient.create( name: 'Rebecca Pope', age: 32)
	visit "/doctors/#{@doc1.id}"
    end

	it 'show doc info' do
		within "doc" do
			expect(page).to have_content("Meredith Grey")
			expect(page).to have_content("General Surgery")
			expect(page).to have_content("Harvard University")
		end
	end



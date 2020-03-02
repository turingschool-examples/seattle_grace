require 'rails_helper'

RSpec.describe 'As a Visitor' do
	describe 'When I visit the Patients index page' do
		before :each do
			@danny = Patient.create!(name: "Danny Moore", age: 35)
			@katie = Patient.create!(name: "Katie Bryce", age: 24)
			@denny = Patient.create!(name: "Denny Duquette", age: 39)
			@rebecca = Patient.create!(name: "Rebecca Pope", age: 32)
			@zola = Patient.create!(name: "Zola Shepherd", age: 2)

			visit '/patients'

			expect(current_path).to eq('/patients')
		end

		it 'I see the names of all patients listed from oldest to youngest' do

			expect(Patient[0]).to eq(@danny)
			expect(Patient[1]).to eq(@denny)
			expect(Patient[2]).to eq(@katie)
			expect(Patient[3]).to eq(@rebecca)
			expect(Patient[4]).to eq(@zola)

			expect(page).to have_content(@danny.name)
			expect(page).to have_content(@denny.name)
			expect(page).to have_content(@katie.name)
			expect(page).to have_content(@rebecca.name)
			expect(page).to have_content(@zola.name)
		end
	end
end

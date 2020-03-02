require 'rails_helper'

RSpec.describe 'As a Visitor' do
	describe 'When I visit the doctors show page' do
		before :each do
			@south = Hospital.create!(name: "South Hospital")
			@holly = @south.doctors.create!(name: "Holly", specialty: "Birth", university: "Harvard University")
			@danny = Patient.create!(name: "Danny Moore", age: 35)
			@katie = Patient.create!(name: "Katie Bryce", age: 24)
			@denny = Patient.create!(name: "Denny Duquette", age: 39)
			@rebecca = Patient.create!(name: "Rebecca Pope", age: 32)
			@zola = Patient.create!(name: "Zola Shepherd", age: 2)

			@holly.patients << @zola
			@holly.patients << @danny
			@holly.patients << @denny
			@holly.patients << @rebecca
			@holly.patients << @katie

			visit "/hospitals/#{@south.id}/doctors/#{@holly.id}"

			expect(current_path).to eq("/hospitals/#{@south.id}/doctors/#{@holly.id}")
		end

		it "I see all of that doctor's information including: name, specialty, university where they got their doctorate" do

			expect(page).to have_content(@holly.name)
			expect(page).to have_content(@holly.specialty)
			expect(page).to have_content(@holly.university)
		end

		it 'I see the name of the hospital where this doctor works' do

			expect(page).to have_content(@south.name)

		end

		it 'I see the names of all of the patients this doctor has' do

			within "#patient-#{@zola.id}" do
				expect(page).to have_content(@zola.name)
			end

			within "#patient-#{@danny.id}" do
				expect(page).to have_content(@danny.name)
			end

			within "#patient-#{@denny.id}" do
				expect(page).to have_content(@denny.name)
			end

			within "#patient-#{@rebecca.id}" do
				expect(page).to have_content(@rebecca.name)
			end

			within "#patient-#{@katie.id}" do
				expect(page).to have_content(@katie.name)
			end
		end
	end
end

require 'rails_helper'

RSpec.describe 'As a Visitor' do
	describe 'When I visit a Hospitals Show page.' do
		before :each do
			@north = Hospital.create!(name: "North Hospital")
			@phil = @north.doctors.create!(name: 'Phil', specialty: "Love", university: "Love School")
			@john = @north.doctors.create!(name: 'John', specialty: "Pediactrics", university: "Hampden University")
			@hellen = @north.doctors.create!(name: 'Hellen', specialty: "cranial", university: "Colorado State University")
			@avery = @north.doctors.create!(name: 'Avery', specialty: "brain stem", university: "Colorado State University")

			visit "/hospitals/#{@north.id}"

			expect(current_path).to eq("/hospitals/#{@north.id}")
		end

		it "I see the hospital's name" do

			expect(page).to have_content(@north.name)
		end

		it "I see the number of doctors that work at this hospital" do

			expect(page).to have_content("Doctor's on staff: 3")
		end

		it "I see a unique list of universities that this hospital's doctors attended" do

			within "#universities" do
				expect(page).to have_content("Love School").times(1)
				expect(page).to have_content("Hampden University").times(1)
				expect(page).to have_content("Colorado State University").times(1)
				expect(page).not_to have_content("Colorado State University").times(2)
			end
		end
	end
end

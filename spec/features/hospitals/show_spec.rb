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

			expect(page).to have_content("Doctors on staff: 4")
		end

		it "I see a unique list of universities that this hospital's doctors attended" do

			expect(page).to have_content("Love School")
			expect(page).to have_content("Hampden University")
			expect(page).to have_content("Colorado State University")
		end
	end
end

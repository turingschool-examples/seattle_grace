require 'rails_helper'

RSpec.describe 'As a Visitor' do
	describe "When I visit an surgery's show page" do

		before(:each) do
			@hosp1 = Hospital.create!(name: "Mass General")

			@doc1 = @hosp1.doctors.create!(name: "Hawkeye", specialty: "Thorasic", university: "UMass")
			@doc2 = @hosp1.doctors.create!(name: "Hunicut", specialty: "Vascular", university: "Minnesota")

			@surgery1 = Surgery.create!(title: "Bypass", day: "Monday", or_number: 10)
			@surgery2 = Surgery.create!(title: "LASIK", day: "Monday", or_number: 20)
			@surgery3 = Surgery.create!(title: "Plastic", day: "Tuesday", or_number: 10)

			visit surgery_path(@surgery1)
		end

		it 'I see the title and operating room number of that surgery' do
			expect(page).to have_content(@surgery1.title)
			expect(page).to have_content(@surgery1.or_number)
		end

		it 'I see the count of doctors that are on this surgery' do
			expect(page).to have_content("Doctor Count: 2")
		end

		it 'I see a labeled section listing titles of all surgeries that same day' do
			expect(page).to have_content("Other surgeries happening this day of the week:")
			within("#other_surgeries") do
				expect(page).to have_content(@surgery2.title)
				expect(page).not_to have_content(@surgery1.title)
				expect(page).not_to have_content(@surgery3.title)
			end
		end
	end
end

# As a visitor
# When I visit a surgery's show page

# And I see a section of the page that says "Other surgeries happening this day of the week:"
# And under that header I see titles of all surgeries that happen on the same day of the week as this surgery

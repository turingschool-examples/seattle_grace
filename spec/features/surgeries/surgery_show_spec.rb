require 'rails_helper'

RSpec.describe 'As a Visitor' do
	describe "When I visit an surgery's show page" do

		before(:each) do
			@surgery1 = Surgery.create!(title: "Bypass", day: "Monday", or_number: 10)

			visit surgery_path(@surgery1)
		end

		it 'I see the title and operating room number of that surgery' do
			expect(page).to have_content(@surgery1.title)
			expect(page).to have_content(@surgery1.or_number)
		end
	end
end

# As a visitor
# When I visit a surgery's show page

# I see the title and operating room number of that surgery

# And I see the count of doctors that are on this surgery

# And I see a section of the page that says "Other surgeries happening this day of the week:"
# And under that header I see titles of all surgeries that happen on the same day of the week as this surgery

require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit a hospital show page' do
    before :each do
      @grey = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      
      @meredith = @grey.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @alex = @grey.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Harvard University")
      @miranda = @grey.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      
      visit "/hospitals/#{@grey.id}"
    end
    
    it "I see that hospitals information" do
      expect(page).to have_content("Hospital: #{@grey.name}")
      expect(page).to have_content("Number of doctors: 3")
      
      within ("#universities_attended") do
        expect(page).to have_content("Universities attended by our doctors:")
        expect(page).to have_content("#{@meredith.university}", count: 1)
        expect(page).to have_content("#{@miranda.university}")
      end
    end
  end
end
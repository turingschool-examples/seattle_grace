require 'rails_helper'

describe "As a Visitor" do
  before :each do 
  @hospital_1 = Hospital.create!(name: "Children's L.A.")


  @dr_1 = @hospital_1.doctors.create!(name: "Paul Nassif", specialty: "Botched Surgery" , university: "St. Louis University School of Medicine")
  @dr_2 = @hospital_1.doctors.create!(name: "Terry Dubrow", specialty: "Botched Surgery", university: "David Geffen School of Medicine at UCLA")
  @dr_3 = @hospital_1.doctors.create!(name: "Scott Auerbach", specialty: "Pediatric", university: "Stanford Hospital and Clinics Program")
  @dr_4 = @hospital_1.doctors.create!(name: "Robert Bishop", specialty: "Pediatric", university: "Nationwide Children's Hospital")
 
  @surgery_1 = Surgery.create!(title: "Knee Surgery", day_of_opp: "Monday", operating_room_number: 111 )
  @surgery_2 = Surgery.create!(title: "Spine Surgery", day_of_opp: "Monday", operating_room_number: 222 )
  @surgery_3 = Surgery.create!(title: "Heart Surgery", day_of_opp: "Tuesday", operating_room_number: 111 )
  
  
  @surgery_1.doctor << [@dr_1, @dr_2]
  @surgery_2.doctor << [@dr_3, @dr_4]
  @surgery_3.doctor << [@dr_1, @dr_2]
  end 
  
  describe "When I visit a surgery's show page" do
    it "I see the title and operating room number of that surgery:" do 
      visit "/surgeries/#{@surgery_1.id}"
      
      expect(page).to have_content(@surgery_1.title)  
      expect(page).to have_content(@surgery_1.operating_room_number)  
    end

    it "I see the count of doctors that are on this surgery" do 
      visit "/surgeries/#{@surgery_1.id}"

      expect(page).to have_content("Number of Doctors Performing Surgery: 2") 
    end 

    it "I see a section of the page that says 'Other surgeries happening this day of the week:, under that header I see titles of all surgeries that happen on the same day of the week as this surgery" do 
      visit "/surgeries/#{@surgery_1.id}"

      expect(page).to have_content("Other surgeries happening this day of the week:")

      expect(page).to have_content(@surgery_1.title)
      expect(page).to have_content(@surgery_2.title)
    end 
  end
end



# User Story 1, Surgery Show Page
# As a visitor 
# When I visit a surgery's show page
# I see the title and operating room number of that surgery
# And I see the count of doctors that are on this surgery
# And I see a section of the page that says "Other surgeries happening this day of the week:"
# And under that header I see titles of all surgeries that happen on the same day of the week as this surgery 

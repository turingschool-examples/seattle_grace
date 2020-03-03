require 'rails_helper'

RSpec.describe "Surgery Show Page" do 
  describe " - when I visit a surgery's show page" do 
    it "then I see the title and operating room of that surgery plus count of doctors on this surgery." do 
      hospital_1 = Hospital.create!(name: "IU Health")

      doctor_1 = hospital_1.doctors.create!(name: "Jordan Sewell", specialty: "General", university: "IU")
      doctor_2 = hospital_1.doctors.create!(name: "Hilary Sewell", specialty: "ENT", university: "Brown")

      surgery_1 = Surgery.create!(title: "Face", day_of_week: "Monday", operating_room_number: 70)
      surgery_2 = Surgery.create!(title: "Back", day_of_week: "Monday", operating_room_number: 7)
      surgery_3 = Surgery.create!(title: "Leg", day_of_week: "Monday", operating_room_number: 100)
      surgery_4 = Surgery.create!(title: "Arm", day_of_week: "Tuesday", operating_room_number: 30)

      doctor_1.surgeries << surgery_1
      doctor_1.surgeries << surgery_2
      doctor_1.surgeries << surgery_3
      doctor_1.surgeries << surgery_4

      visit "/surgeries/#{surgery_1.id}"

      expect(page).to have_content("Face")
      expect(page).to have_content(70)
      expect(page).to have_content("Doctors: 1")
    end 

    it "I see a heading that says 'other surgeries happening this day of the week:' and see those surgeries under this header" do 
            hospital_1 = Hospital.create!(name: "IU Health")

      doctor_1 = hospital_1.doctors.create!(name: "Jordan Sewell", specialty: "General", university: "IU")
      doctor_2 = hospital_1.doctors.create!(name: "Hilary Sewell", specialty: "ENT", university: "Brown")

      surgery_1 = Surgery.create!(title: "Face", day_of_week: "Monday", operating_room_number: 70)
      surgery_2 = Surgery.create!(title: "Back", day_of_week: "Monday", operating_room_number: 7)
      surgery_3 = Surgery.create!(title: "Leg", day_of_week: "Monday", operating_room_number: 100)
      surgery_4 = Surgery.create!(title: "Arm", day_of_week: "Tuesday", operating_room_number: 30)

      doctor_1.surgeries << surgery_1
      doctor_1.surgeries << surgery_2
      doctor_1.surgeries << surgery_3
      doctor_1.surgeries << surgery_4

      visit "/surgeries/#{surgery_1.id}"

      expect(page).to have_content("Other surgeries happening this day of the week:")
      
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
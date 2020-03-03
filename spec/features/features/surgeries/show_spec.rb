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
      save_and_open_page
      expect(page).to have_content("Other surgeries happening this day of the week:")
      expect(page).to have_content(surgery_2.title)
      expect(page).to have_content(surgery_3.title)
      expect(page).to_not have_content(surgery_4.title)
    end 

    it "I see a surgery's title, date, and I see a field with instructions to 'Add A Doctor To This Surgery' " do 
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

      fill_in :doctor_id, with: 70
      click_on "Submit"
      binding.pry

      expect(current_path).to eq("/surgeries/#{surgery_1.id}")
      expect(page).to have_content(doctor_2.name)
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

# User Story 2, Add a Doctor to a Surgery
# As a visitor
# When I visit a surgery's show page
# I see a surgery's title, date, and 
# I see a field with instructions to "Add A Doctor To This Surgery" 
# When I input a doctor's unique id into that field
# And click submit
# I'm taken back to that surgery's show page
# And I see the name of that doctor listed on the page
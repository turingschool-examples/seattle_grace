require 'rails_helper'

describe "As a Visitor" do
  before :each do 
  @hospital_1 = Hospital.create!(name: "Children's L.A.")


  @dr_1 = @hospital_1.doctors.create!(name: "Paul Nassif", specialty: "Botched Surgery" , university: "St. Louis University School of Medicine")
  @dr_2 = @hospital_1.doctors.create!(name: "Terry Dubrow", specialty: "Botched Surgery", university: "David Geffen School of Medicine at UCLA")
 
  @surgery_1 = Surgery.create!(title: "Knee Surgery", day_of_opp: "Monday", operating_room_number: 111 )
  @surgery_2 = Surgery.create!(title: "Spine Surgery", day_of_opp: "Monday", operating_room_number: 222 )
  @surgery_3 = Surgery.create!(title: "Heart Surgery", day_of_opp: "Tuesday", operating_room_number: 111 )
  
  @surgery_1.doctor << @dr_1

  end 
  
  describe "When I visit a surgery's show page" do
    it "I see a surgery's title, date, and  'Add A Doctor To This Surgery'" do 
      visit "/surgeries/#{@surgery_1.id}"
      
      expect(page).to have_content(@surgery_1.title)  
      expect(page).to have_content("Add A Doctor To This Surgery")  
    end

    it "can add doctor to surgery" do 
      visit "/surgeries/#{@surgery_1.id}"
      
      fill_in :doctor_id, with: @dr_2.id
      
      click_button 'Submit'

      expect(current_path).to eq("/surgeries/#{@surgery_1.id}")


      expect(page).to have_content(@dr_2.name)
      expect(page).to have_content(@surgery_1.title)
      expect(page).to have_content(@surgery_2.title)
    end 
  end
end


# User Story 2, Add a Doctor to a Surgery
# As a visitor
# When I visit a surgery's show page
# I see a surgery's title, date, and 
# I see a field with instructions to "Add A Doctor To This Surgery" 

# When I input a doctor's unique id into that field
# And click submit
# I'm taken back to that surgery's show page
# And I see the name of that doctor listed on the page

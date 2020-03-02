require 'rails_helper'

describe "As a Visitor" do
  before :each do 
  @hospital_1 = Hospital.create!(name: "Children's L.A.")

  @dr_1 = @hospital_1.doctors.create!(name: "Paul Nassif", specialty: "Botched Surgery" , university: "St. Louis University School of Medicine")
  @dr_2 = @hospital_1.doctors.create!(name: "Terry Dubrow", specialty: "Botched Surgery", university: "David Geffen School of Medicine at UCLA")
  @dr_3 = @hospital_1.doctors.create!(name: "Scott Auerbach", specialty: "Pediatric", university: "St. Louis University School of Medicine")
  @dr_4 = @hospital_1.doctors.create!(name: "Robert Bishop", specialty: "Pediatric", university: "Nationwide Children's Hospital")
 

  end 
  describe "When I visit a hospital's show page" do
    it "I see the hospital's name and the number of doctors that work at this hospital" do 
      visit "/hospitals/#{@hospital_1.id}"

      expect(page).to have_content(@hospital_1.name) 

      expect(page).to have_content("Number of Doctors: 4")  
      save_and_open_page
    end
    
    # it "I see a unique list of universities that this hospital's doctors attended" do 
    #   visit "/doctors/#{@dr_1.id}"
    
    #   expect(page).to have_content(@dr_1.university)  
    #   expect(page).to have_content(@dr_2.university)  
    #   expect(page).to have_content(@dr_3.university)  
    #   expect(page).to have_content(@dr_4.university)  
    
    # end
  end
end

# <h3>University: <%= "#{@doctor.university}" %></h3>


# User Story 3, Hospital Show Page
# ​
# As a visitor
# When I visit a hospital's show page
# I see the hospital's name
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended
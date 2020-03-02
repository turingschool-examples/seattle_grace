require 'rails_helper'

describe "As a Visitor" do
  before :each do 
  @hospital_1 = Hospital.create!(name: "Children's L.A.")
  @hospital_2 = Hospital.create!(name: "Children's Denver")
  @hospital_3 = Hospital.create!(name: "National Jewish Health")

  @dr_1 = @hospital_1.doctors.create!(name: "Paul Nassif", specialty: "Botched Surgery" , university: "St. Louis University School of Medicine")
  @dr_2 = @hospital_1.doctors.create!(name: "Terry Dubrow", specialty: "Botched Surgery", university: "David Geffen School of Medicine at UCLA")
  @dr_3 = @hospital_2.doctors.create!(name: "Scott Auerbach", specialty: "Pediatric", university: "Stanford Hospital and Clinics Program")
  @dr_4 = @hospital_2.doctors.create!(name: "Robert Bishop", specialty: "Pediatric", university: "Nationwide Children's Hospital")
  @dr_5 = @hospital_3.doctors.create!(name: "Nathan Rabinovitch", specialty: "Pediatric", university: "Mcgill University Medical School")
  @dr_6 = @hospital_3.doctors.create!(name: "Jordan Abbott", specialty: "Allergic Disease", university: "University of California, Berkeley")

  @patient_1 = Patient.create!(name: "Liz", age: 25)
  @patient_3 = Patient.create!(name: "Josh", age: 32)
  @patient_4 = Patient.create!(name: "Danny", age: 26)
  @patient_5 = Patient.create!(name: "Alyssa", age: 30)
  @patient_2 = Patient.create!(name: "Claudia", age: 34)
  @patient_6 = Patient.create!(name: "Elizabeth", age: 25)
  
  @dr_1.patients << @patient_1
  @dr_2.patients << @patient_2
  @dr_3.patients << @patient_3
  @dr_4.patients << @patient_4
  @dr_5.patients << @patient_5
  @dr_6.patients << @patient_6


  end 
  describe "When I visit a docto5's show page" do
    
  end
  
  it "Can see all of that doctor's information including:" do 
    visit "/doctors/#{@dr_1.id}"

    expect(page).to have_content(@dr_1.name)  
    expect(page).to have_content(@dr_1.specialty)  
    expect(page).to have_content(@dr_1.university)  
    expect(page).to have_content(@hospital_1.name)  
  end
end



# As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#   - name
#   - specialty
#   - university where they got their doctorate
# And I see the name of the hospital where this doctor works

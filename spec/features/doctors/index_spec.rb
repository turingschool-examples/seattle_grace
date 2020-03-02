require 'rails_helper'

describe "Can create drs" do
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

  end 

  it "can see all drs" do 

    visit "/hospitals"
  end
end

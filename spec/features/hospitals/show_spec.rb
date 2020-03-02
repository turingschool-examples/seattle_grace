require "rails_helper"

RSpec.describe "on the show page", type: :feature do
  describe "as a visitor" do
    it "can see the hospital name and the number of doctors and universiteis doctors attended" do
      
      hospital_1 = Hospital.create(name: "Grey Sloan Memorial Hospital")
      hospital_2 = Hospital.create(name: "Pacific Northwest General Hospital")


      doctor_1 = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital: hospital_1)
      doctor_2 = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University", hospital: hospital_1)
      doctor_3 = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University", hospital: hospital_1)
      doctor_4 = Doctor.create(name: "Derek Webber", specialty: "Attending Surgeon", university: "University of Pennsylvania", hospital: hospital_1)
      doctor_5 = Doctor.create(name: "Derek Webber", specialty: "Attending Surgeon", university: "University of Pennsylvania", hospital: hospital_1)

      visit "/hospitals/#{hospital_1.id}"

      expect(page).to have_content(hospital_1.name)
      expect(page).to_not have_content(hospital_2.name)
      expect(page).to have_content(doctor_1.university)
      expect(page).to have_content(doctor_2.university)
      expect(page).to have_content(doctor_3.university)
      expect(page).to have_content(doctor_4.university)
      expect(hospital_1.unique_universities).to eq (["Harvard University", "Johns Hopkins University", "Stanford University", "University of Pennsylvania"])
    end  
  end
end

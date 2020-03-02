require "rails_helper"

RSpec.describe "on a hospital show page" do
  context "as a visitor" do
    before(:each) do
      @hospital_1 = Hospital.create(name: "Grey Sloan Memorial Hospital")
      @hospital_2 = Hospital.create(name: "Pacific Northwest General Hospital")
      @hospital_3 = Hospital.create(name: "New York Hospital")
      @doctor_1 = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital: @hospital_1)
      @doctor_2 = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "John Hopkins University", hospital: @hospital_2)
      @doctor_3 = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University", hospital: @hospital_3)
      @doctor_4 = Doctor.create(name: "Derek Webber", specialty: "Attending Surgeon", university: "University of Pennsylvania", hospital: @hospital_1)
      @doctor_5 = Doctor.create(name: "House", specialty: "Attending Surgeon", university: "John Hopkins University", hospital: @hospital_1)
      @patient_1 = Patient.create(name: "Katie Bryce", age: 27, doctors: [@doctor_1])
      @patient_2 = Patient.create(name: "Denny Duquette", age: 20, doctors: [@doctor_2])
      @patient_3 = Patient.create(name: "Rebecca Pope", age: 13, doctors: [@doctor_1, @doctor_3])
      @patient_4 = Patient.create(name: "Zola Shepard", age: 40, doctors: [@doctor_4])
    end
    it "can see the hospital's name" do
      visit "/hospitals/#{@hospital_1.id}"
      expect(page).to have_content(@hospital_1.name)
      expect(page).to_not have_content(@hospital_2.name)
    end
    it "can see the number of doctors that work at the hospital" do
      visit "/hospitals/#{@hospital_1.id}"
      expect(page).to have_content("Number of Doctors at this Hospital: 3")
    end
    it "can see a unique list of universities that the doctors at the hosiptal have attended" do
      visit "/hospitals/#{@hospital_1.id}"
      expect(page).to have_content(@doctor_1.university)
      expect(page).to have_content(@doctor_4.university)
      expect(page).to have_content("John Hopkins University", count: 1)
      expect(page).to_not have_content(@doctor_3.university)
    end
  end
end

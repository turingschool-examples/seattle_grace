require 'rails_helper'

describe "as a visitor" do
  describe "at the hospital show page" do
    before :each do
      #hospitals
      @greysloan = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @pacific = Hospital.create!(name: "Pacific Northwest General Hospital")
      @newyork = Hospital.create!(name: "New York Hospital")
      @seattle = Hospital.create!(name: "Seattle Grace Hospital")
      #doctors
      @merideth = Doctor.create!(name: "Meredith Grey", specialty:"General Surgery", university: "Harvard University", hospital: @seattle)
      @alex = Doctor.create!(name: "Alex Karev", specialty:"Pediatric Surgery", university: "Johns Hopkins University", hospital: @seattle)
      @miranda = Doctor.create!(name: "Miranda Bailey", specialty:"General Surgery", university: "Stanford University", hospital: @seattle)
      @derek = Doctor.create!(name: "Derek Webber", specialty:"Attending Surgeon", university: "University of Pennsylvania", hospital: @seattle)
      #patients
      @katie = Patient.create!(name: "Katie Bryce", age: 24)
      @denny = Patient.create!(name: "Denny Duquette", age: 39)
      @rebecca = Patient.create!(name: "Rebecca Pope", age: 32)
      @zola = Patient.create!(name: "Zola  Shepherd", age: 2)

      DoctorPatient.create!(doctor: @merideth, patient: @katie)
      DoctorPatient.create!(doctor: @merideth, patient: @rebecca)

    end

    it "can see all of the hospital's information" do
      visit "/hospitals/#{@seattle.id}"

      expect(page).to have_content(@seattle.name)
      expect(page).to have_content(@seattle.doctors.count)
      expect(page).to have_content(@merideth.university)
      expect(page).to have_content(@alex.university)
      expect(page).to have_content(@derek.university)
      expect(page).to have_content(@miranda.university)
    end
  end
end

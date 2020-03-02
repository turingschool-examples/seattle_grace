require 'rails_helper'



describe "as a visitor" do
  describe "at the doctor show page" do
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

    it "can see all of the doctor's information" do
      visit "/doctors/#{@merideth.id}"

      expect(page).to have_content(@merideth.name)
      expect(page).to have_content(@merideth.specialty)
      expect(page).to have_content(@merideth.university)
      expect(page).to have_content(@merideth.hospital.name)

      within "#patient-#{@katie.id}" do
        expect(page).to have_content(@katie.name)
      end

      within "#patient-#{@rebecca.id}" do
        expect(page).to have_content(@rebecca.name)
      end
    end
  end
end

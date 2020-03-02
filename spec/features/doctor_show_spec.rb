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
      expect(page).to have_content(@merideth.speciality)
      expect(page).to have_content(@merideth.university)
      expect(page).to have_content(@merideth.hospital)

      within "#patient-#{@katie.id}" do
        expect(page).to have_content(@katie.name)
      end

      within "#patient-#{@rebecca.id}" do
        expect(page).to have_content(@rebecca.name)
      end
    end
  end
end

# As a visitor
# When I visit a doctor's show page
# I see all of that doctor's information including:
#   - name
#   - specialty
#   - university where they got their doctorate
# And I see the name of the hospital where this doctor works
# And I see the names of all of the patients this doctor has
# ```
# ​
# ```
# User Story 2, Patient Index Page
# ​
# As a visitor
# When I visit the patient index page
# I see the names of all patients listed from oldest to youngest
# ```
# ​
# ```
# User Story 3, Hospital Show Page
# ​
# As a visitor
# When I visit a hospital's show page
# I see the hospital's name
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended
# ```
# ​
# ​
# ```
# User Story 4, Remove a Patient from a Doctor
# ​
# As a visitor
# When I visit a Doctor's show page
# Next to each patient's name, I see a button to remove that patient from that doctor's caseload
# When I click that button for one patient
# I'm brought back to the Doctor's show page
# And I no longer see that patient's name listed

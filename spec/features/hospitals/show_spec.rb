require 'rails_helper'

RSpec.describe 'hospital show page', type: :feature do
  describe 'I see name of hospital, count of docs, and unique list of schools ' do
    before(:each) do
      @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @hospital2 = Hospital.create!(name: "Pacific Northwest General Hospital")
      @doc1 = @hospital1.doctors.create!(name: "Meredith Grey",
                              specialty: "General Surgery",
                              university: "Harvard University")
      @doc2 = @hospital2.doctors.create!(name: "Alex Karev",
                              specialty: "Pediatric Surgery",
                              university: "Johns Hopkins University")
      @doc3 = @hospital1.doctors.create!(name: "Miranda Bailey",
                              specialty: "General Surgery",
                              university: "Stanford University")

      @patient1 = Patient.create!(name: "Katie Bryce",
                              age: 24)
      @patient2 = Patient.create!(name: "Denny Duquette",
                              age: 39)
      @patient3 = Patient.create!(name: "Rebecca Pope",
                              age: 32)
      @patient4 = Patient.create!(name: "Zola  Shepherd",
                              age: 2)
      DoctorPatient.create!(doctor_id: @doc1.id, patient_id: @patient1.id )
      DoctorPatient.create!(doctor_id: @doc1.id, patient_id: @patient2.id )
      DoctorPatient.create!(doctor_id: @doc2.id, patient_id: @patient3.id )
      DoctorPatient.create!(doctor_id: @doc3.id, patient_id: @patient4.id )

      visit "/hospitals/#{@hospital1.id}"
    end
    it " shows the name of hospital" do
      expect(page).to have_content(@hospital1.name )
    end
    it " shows the count of docs working there" do
      expect(page).to have_content("Number of Doctors employeed:2")
    end
    it " shows list of all uniqie schools docs went to" do

      expect(page).to have_content("Harvard University\nStanford University")
    end
  end
end


# As a visitor
# When I visit a hospital's show page
# I see the hospital's name
# And I see the number of doctors that work at this hospital
# And I see a unique list of universities that this hospital's doctors attended

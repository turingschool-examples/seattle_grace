require "rails_helper"

RSpec.describe "on the patient index page" do
  context "as a visitor" do
    before(:each) do
      @hospital_1 = Hospital.create(name: "Grey Sloan Memorial Hospital")
      @hospital_2 = Hospital.create(name: "Pacific Northwest General Hospital")
      @hospital_3 = Hospital.create(name: "New York Hospital")
      @doctor_1 = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital: @hospital_1)
      @doctor_2 = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "John Hopkins University", hospital: @hospital_2)
      @doctor_3 = Doctor.create(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University", hospital: @hospital_3)
      @doctor_4 = Doctor.create(name: "Derek Webber", specialty: "Attending Surgeon", university: "University of Pennsylvania", hospital: @hospital_1)
      @patient_1 = Patient.create(name: "Katie Bryce", age: 27, doctors: [@doctor_1])
      @patient_2 = Patient.create(name: "Denny Duquette", age: 20, doctors: [@doctor_2])
      @patient_3 = Patient.create(name: "Rebecca Pope", age: 13, doctors: [@doctor_1, @doctor_3])
      @patient_4 = Patient.create(name: "Zola Shepard", age: 40, doctors: [@doctor_4])
    end
    it "can see the names of all patients from oldest to youngest" do
      visit "/patients"
      within(".patients-0") do
        expect(page.all('li')[0]).to have_content(@patient_4.name)
        expect(page.all('li')[1]).to have_content(@patient_1.name)
        expect(page.all('li')[2]).to have_content(@patient_2.name)
        expect(page.all('li')[3]).to have_content(@patient_3.name)
      end
    end
  end
end

require 'rails_helper'

describe 'as a visitor' do
  describe 'navigation' do
    before :each do
      @hospital_1 = Hospital.create(name: "Grey Sloan Memorial Hospital")
      @hospital_2 = Hospital.create(name: "Pacific Northwest General Hospital")
      @hospital_3 = Hospital.create(name: "New York Hospital")
      @hospital_4 = Hospital.create(name: "Seattle Grace Hospital")

      @doctor_1 = @hospital_1.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @doctor_2 = @hospital_1.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
      @doctor_3 = @hospital_2.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      @doctor_4 = @hospital_3.doctors.create(name: "Derek Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania")
      @doctor_5 = @hospital_4.doctors.create(name: "Freddy McPatrick", specialty: "Doctor Doctor", university: "MSU")


      @patient_1 = Patient.create(name: "Katie Bryce", age: 24)
      @patient_2 = Patient.create(name: "Denny Duquette", age: 39)
      @patient_3 = Patient.create(name: "Rebecca Pope", age: 32)
      @patient_4 = Patient.create(name: "Zola Shepherd", age: 2)

      PatientDoctor.create!(patient_id: @patient_1.id, doctor_id: @doctor_1.id)
      PatientDoctor.create!(patient_id: @patient_2.id, doctor_id: @doctor_1.id)
      PatientDoctor.create!(patient_id: @patient_2.id, doctor_id: @doctor_2.id)
      PatientDoctor.create!(patient_id: @patient_3.id, doctor_id: @doctor_3.id)
      PatientDoctor.create!(patient_id: @patient_3.id, doctor_id: @doctor_4.id)
      PatientDoctor.create!(patient_id: @patient_4.id, doctor_id: @doctor_4.id)
    end

    it "should see patient information on index page" do

      visit "/patients"

      # save_and_open_page

      within "#patient-#{@patient_1.id}" do
        expect(page).to have_content(@patient_1.name)
      end

      within "#patient-#{@patient_2.id}" do
        expect(page).to have_content(@patient_2.name)
      end

      within "#patient-#{@patient_3.id}" do
        expect(page).to have_content(@patient_3.name)
      end

      within "#patient-#{@patient_4.id}" do
        expect(page).to have_content(@patient_4.name)
      end

    end

  end
end

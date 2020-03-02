require "rails_helper"

RSpec.describe "on the show page", type: :feature do 
  describe "as a visitor" do 
    it "can see all that doctors informaiton" do
      hospital_1 = Hospital.create(name: "Grey Sloan Memorial Hospital")
      hospital_2 = Hospital.create(name: "Pacific Northwest General Hospital")
      doctor_1 = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital: hospital_1)
      doctor_2 = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University", hospital: hospital_2)
      patient_1 = Patient.create(name: "Katie Bryce", age: "24")
      patient_2 = Patient.create(name: "Denny Duquette", age: "39")
      DoctorPatient.create(doctor: doctor_1, patient: patient_1)
      DoctorPatient.create(doctor: doctor_1, patient: patient_2)

      visit "/doctors/#{doctor_1.id}"

      expect(page).to have_content(doctor_1.name)
      expect(page).to have_content(doctor_1.specialty)
      expect(page).to have_content(doctor_1.university)
      expect(page).to have_content(hospital_1.name)
      expect(page).to_not have_content(hospital_2.name)
      expect(page).to have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)
    end

    it "can remove patient from doctor" do
      hospital_1 = Hospital.create(name: "Grey Sloan Memorial Hospital")
      hospital_2 = Hospital.create(name: "Pacific Northwest General Hospital")
      doctor_1 = Doctor.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital: hospital_1)
      doctor_2 = Doctor.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University", hospital: hospital_2)
      patient_1 = Patient.create(name: "Katie Bryce", age: "24")
      patient_2 = Patient.create(name: "Denny Duquette", age: "39")
      DoctorPatient.create(doctor: doctor_1, patient: patient_1)
      DoctorPatient.create(doctor: doctor_2, patient: patient_1)
      DoctorPatient.create(doctor: doctor_1, patient: patient_2)
      DoctorPatient.create(doctor: doctor_2, patient: patient_2)

      visit "/doctors/#{doctor_1.id}"

      expect(page).to have_content(doctor_1.name)

      expect(page).to have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)

      within "#patient-#{patient_1.id}" do
        click_on "remove patient from doctor"
      end
      expect(current_path).to eq ("/doctors/#{doctor_1.id}")

      expect(page).to have_content(doctor_1.name)

      expect(page).to_not have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)

      visit "/doctors/#{doctor_2.id}"

      expect(page).to have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)
    end
  end
end

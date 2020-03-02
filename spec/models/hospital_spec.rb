require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe "instance methods" do
    it "doctor_count" do
      hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      hospital_2 = Hospital.create!(name: "Pacific Northwest General Hospital")
      doctor_1 = hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      doctor_2 = hospital_1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
      doctor_3 = hospital_1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      doctor_4 = hospital_2.doctors.create!(name: "Derek Webber", specialty: "Attending Surgeon", university: "University of Pennsylvania")
      doctor_5 = hospital_2.doctors.create!(name: "James McGraph", specialty: "Some Doctor Dude", university: "University of Docs")

      expect(hospital_1.doctor_count).to eq(3)
      expect(hospital_2.doctor_count).to eq(2)
    end

    it "universities_represented" do
      hospital_1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      hospital_2 = Hospital.create!(name: "Pacific Northwest General Hospital")
      doctor_1 = hospital_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      doctor_2 = hospital_1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
      doctor_3 = hospital_1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      doctor_4 = hospital_2.doctors.create!(name: "Derek Webber", specialty: "Attending Surgeon", university: "University of Pennsylvania")
      doctor_5 = hospital_2.doctors.create!(name: "James McGraph", specialty: "Some Doctor Dude", university: "University of Docs")
      doctor_6 = hospital_2.doctors.create!(name: "Sara McGraph", specialty: "Some Doctor Chick", university: "University of Docs")

      expect(hospital_1.universities_represented).to eq(["Harvard University", "Johns Hopkins University", "Stanford University"])
      expect(hospital_2.universities_represented).to eq(["University of Pennsylvania", "University of Docs"])
    end
  end
end

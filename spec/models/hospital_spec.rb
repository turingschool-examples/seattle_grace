require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe 'instance methods' do
    it "can count the number of doctors" do
      Hospital.destroy_all
      Doctor.destroy_all

      hospital_1 = Hospital.create(
        name: "Grey Sloan Memorial Hospital"
        )

      hospital_2 = Hospital.create(
        name: "Pacific Northwest General Hospital"
        )

      doctor_1 = Doctor.create!(
          name: "Meredith Grey",
          specialty: "General Surgery",
          university: "Harvard",
          hospital: hospital_1
        )

      doctor_2 = Doctor.create!(
          name: "Alex Karev",
          specialty: "Pediatric Surgery",
          university: "Johns Hopkins University",
          hospital: hospital_1
        )

      doctor_3 = Doctor.create!(
          name: "Miranda Bailey",
          specialty: "General Surgery",
          university: "Stanford University",
          hospital: hospital_2
        )

      doctor_4 = Doctor.create!(
          name: "Not a doctor. Just need a university",
          specialty: "Soemthing",
          university: "Johns Hopkins University",
          hospital: hospital_1
        )

      expect(hospital_1.count_doctors).to eq(3)
    end

    it "can provide a list of the unique universities of the doctors" do

      Hospital.destroy_all
      Doctor.destroy_all

      hospital_1 = Hospital.create(
        name: "Grey Sloan Memorial Hospital"
        )

      hospital_2 = Hospital.create(
        name: "Pacific Northwest General Hospital"
        )

      doctor_1 = Doctor.create!(
          name: "Meredith Grey",
          specialty: "General Surgery",
          university: "Harvard",
          hospital: hospital_1
        )

      doctor_2 = Doctor.create!(
          name: "Alex Karev",
          specialty: "Pediatric Surgery",
          university: "Johns Hopkins University",
          hospital: hospital_1
        )

      doctor_3 = Doctor.create!(
          name: "Miranda Bailey",
          specialty: "General Surgery",
          university: "Stanford University",
          hospital: hospital_2
        )

      doctor_4 = Doctor.create!(
          name: "Not a doctor. Just need a university",
          specialty: "Soemthing",
          university: "Johns Hopkins University",
          hospital: hospital_1
        )

      expect(hospital_1.distinct_universities).to eq(["Harvard", "Johns Hopkins University"])
    end
  end
end

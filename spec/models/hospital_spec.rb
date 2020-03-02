require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe "instance methods" do
    it "#total_doctors" do
      hospital1 = Hospital.create!(name: "Sacred Heart")
      hospital2 = Hospital.create!(name: "Pacific Northwest General Hospital")

      doctor1 = Doctor.create!(name: "Turk", specialty: "Surgery", university: "Harvard University", hospital: hospital1)
      doctor2 = Doctor.create!(name: "Carla", specialty: "Nursing", university: "New Jersey University", hospital: hospital2)
      doctor3 = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital: hospital1)
      doctor4 = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University", hospital: hospital1)

      expect(hospital1.total_doctors).to eq(3)
    end

    it "#unique_universities" do
      hospital1 = Hospital.create!(name: "Sacred Heart")
      hospital2 = Hospital.create!(name: "Pacific Northwest General Hospital")

      doctor1 = Doctor.create!(name: "Turk", specialty: "Surgery", university: "Harvard University", hospital: hospital1)
      doctor2 = Doctor.create!(name: "Carla", specialty: "Nursing", university: "New Jersey University", hospital: hospital2)
      doctor3 = Doctor.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University", hospital: hospital1)
      doctor4 = Doctor.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University", hospital: hospital1)

      expect(hospital1.unique_universities).to eq(["Harvard University", "Johns Hopkins University"])
    end
  end
end

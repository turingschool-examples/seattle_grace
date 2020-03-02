require 'rails_helper'

RSpec.describe HospitalDisplay, type: :model do
  before :each do
    hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    doctor_1 = hospital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    doctor_2 = hospital.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    doctor_3 = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

    # Additional Doctor with same university to test uniqiness
    doctor_5 = hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @display = HospitalDisplay.new(hospital)
  end
  describe "display_methods" do
    it '#doctor_count' do
      expect(@display.doctor_count).to eq(4)
    end

    it '#doctor_universities' do
      expect(@display.doctor_universities).to eq(["Harvard University", "Johns Hopkins University", "Stanford University"])
    end
  end
end
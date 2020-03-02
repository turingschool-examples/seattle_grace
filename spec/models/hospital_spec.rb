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
      hospital_1 = Hospital.create(name: "Seattle Grace Hospital")
      hospital_2 = Hospital.create(name: "New York Hospital")
      doctor_1 = Doctor.create(name: "Meredith Grey",
                              specialty: "General Surgery",
                              university: "Harvard University")
      doctor_2 = Doctor.create(name: "Alex Karev",
                              specialty: "Pediatric Surgery",
                              university: "Johns Hopkins University")
      doctor_3 = Doctor.create(name: "Derek McDreamy Shepherd",
                              specialty: "Attending Surgeon",
                              university: "University of Pennsylvania")

      hospital_1.doctors << doctor_1
      hospital_1.doctors << doctor_2
      hospital_2.doctors << doctor_3

      expect(hospital_1.total_doctors).to eq(2)
    end
  end
end

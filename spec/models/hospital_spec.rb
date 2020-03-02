require 'rails_helper'

RSpec.describe Hospital, type: :model do
  before :each do
    @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")

    @doctor_1 = @hospital.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @doctor_2 = @hospital.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")

    @patient_1 = @doctor_1.patients.create(name: "Katie Bryce", age: 24)
    @patient_2 = @doctor_1.patients.create(name: "Denny Duquette", age: 39)

    @patients = Patient.all
  end

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe 'methods' do
    it "total_doctors" do
      expect(@hospital.total_doctors).to eq(2)
    end
  end


end

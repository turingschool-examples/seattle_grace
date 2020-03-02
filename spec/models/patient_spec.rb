require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "relationships" do
    it { should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe "instance methods" do
    it "#by_age" do
      hospital_1 = Hospital.create(name: "Seattle Grace Hospital")
      doctor_1 = Doctor.create(name: "Meredith Grey",
                              specialty: "General Surgery",
                              university: "Harvard University")
      doctor_2 = Doctor.create(name: "Alex Karev",
                              specialty: "Pediatric Surgery",
                              university: "Johns Hopkins University")
      patient_1 = Patient.create(name: "Katie Bryce",
                                age: 24)
      patient_2 = Patient.create(name: "Denny Duquette",
                                age: 39)
      patient_3 = Patient.create(name: "Rebecca Pope",
                                age: 32)

      hospital_1.doctors << doctor_1
      hospital_1.doctors << doctor_2
      doctor_1.patients << patient_1
      doctor_1.patients << patient_2
      doctor_1.patients << patient_3

      expect(Patient.by_age).to eq([patient_2, patient_3, patient_1])
    end
  end
end

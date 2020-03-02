require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe "relationships" do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe "class methods" do
    before(:each) do
      @hospital1 = Hospital.create(name: "Seattle Grace")
      @hospital2 = Hospital.create(name: "New York Hospital")

      @doctor1 = @hospital1.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @doctor2 = @hospital1.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")

      @patient1 = @doctor1.patients.create(name: "Katie Bryce", age: 24)
      @patient2 = @doctor1.patients.create(name: "Denny Duquette", age: 39)
      @patient3 = @doctor2.patients.create(name: "Rebecca Pope", age: 32)
      @patient4 = @doctor2.patients.create(name: "Zola Shepherd", age: 2)

      @patients = Patient.all
    end

    it "#sorted"  do
      expect(@patients.sorted).to eq([@patient2, @patient3, @patient1, @patient4])
    end
  end
end

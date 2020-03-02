require 'rails_helper'

RSpec.describe Patient, type: :model do
  before :each do
    @hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")

    @doctor = @hospital.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")

    @patient_1 = @doctor.patients.create(name: "Katie Bryce", age: 24)
    @patient_2 = @doctor.patients.create(name: "Denny Duquette", age: 39)

    @patients = Patient.all
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe 'relationships' do
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe 'methods' do
    it 'ordered_patients' do
      expect(@patients.ordered_patients).to eq([@patient_2, @patient_1])
    end
  end
end

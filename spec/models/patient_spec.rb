require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end
  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe 'instance methods' do
    it ".order_by_age_from_oldest" do
      grey_hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")
      meredith = grey_hospital.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      alex = Patient.create(name: "Alex Gallant", age: 31)
      shane = Patient.create(name: "Shane Walton", age: 29)
      gordon = Patient.create(name: "Gordon Webb", age: 30)

      meredith.patients << [alex, shane, gordon]

      expect(Patient.order_by_age_from_oldest.first).to eq(alex)
      expect(Patient.order_by_age_from_oldest.last).to eq(shane)
    end
  end
end

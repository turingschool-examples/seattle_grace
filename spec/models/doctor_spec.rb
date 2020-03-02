require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :specialty}
    it {should validate_presence_of :university}
  end

  describe 'relationships' do
    it {should belong_to :hospital}
    it {should have_many :doctor_patients}
    it {should have_many(:patients).through(:doctor_patients)}
  end

  describe "methods" do
    it "#remove_patient" do
      hos1 = Hospital.create(name: "St. Marry's")

      dr1 = hos1.doctors.create(name: "Marry", specialty: "Brain Surgen", university: "Denver University")

      pat1 = dr1.patients.create(name: "Ben", age: 25)
      pat2 = dr1.patients.create(name: "George", age: 40)

      dr1.remove_patient(pat1)
      expect(dr1.patients).to eq([pat2])
      expect(Patient.all).to eq([pat1, pat2])
    end
  end
end

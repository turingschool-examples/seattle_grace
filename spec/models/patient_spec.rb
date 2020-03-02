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

  describe "methods" do
    it "oldest_youngest" do
      pat1 = Patient.create(name: "Ben", age: 25)
      pat2 = Patient.create(name: "George", age: 40)
      pat3 = Patient.create(name: "Sally", age: 30)
      pat4 = Patient.create(name: "Carl", age: 32)
      pat5 = Patient.create(name: "Ryan", age: 30)

      patients = Patient.all

      expect(patients.oldest_youngest).to eq([pat2, pat4, pat3, pat5, pat1])
    end
  end
end

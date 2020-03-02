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
    it "can order patients by age" do
      pt1 = Patient.create!(name: "Kathleen", age: 10)
      pt2 = Patient.create!(name: "Zeke", age: 20)
      pt3 = Patient.create!(name: "Meg", age: 21)

      expected_result = [pt3, pt2, pt1]
      expect(Patient.oldest_to_youngest).to eq(expected_result)
    end
  end
end

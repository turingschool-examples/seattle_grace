require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe 'relationships' do
    it {should have_many :patient_doctors}
    it {should have_many(:doctors).through(:patient_doctors)}
  end

  describe 'methods' do
    it "ordered_by_age" do
      p3 = Patient.create!({
        name: "Jan",
        age: 30
        })
      p4 = Patient.create!({
        name: "Mike",
        age: 35
        })
      p5 = Patient.create!({
        name: "Becca",
        age: 52
        })

      expect(Patient.ordered_by_age).to eq([p5,p4,p3])
    end
  end
end

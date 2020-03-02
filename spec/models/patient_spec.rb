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

  describe 'class methods' do
    it ".order_by_age_from_oldest" do
      alex = Patient.create(name: "Alex Gallant", age: 31)
      shane = Patient.create(name: "Shane Walton", age: 29)
      gordon = Patient.create(name: "Gordon Webb", age: 30)

      expect(Patient.order_by_age_from_oldest.first).to eq(alex)
      expect(Patient.order_by_age_from_oldest.last).to eq(shane)
    end
  end
end

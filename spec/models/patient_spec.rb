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

  describe "methods" do
    it 'should show patients from oldest to youngest' do
      patient1 = Patient.create!(name: 'Christian', age: 28)
      patient2 = Patient.create!(name: 'Tanner', age: 26)
      patient3 = Patient.create!(name: 'Kelly', age: 31)
      patients = [patient1, patient2, patient3]

      expect(Patient.give_age_order).to eq([patient3, patient1, patient2])
    end
  end
end

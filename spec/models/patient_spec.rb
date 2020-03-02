require 'rails_helper'

describe Patient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end
  
  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end
  
  describe 'models' do
    before :each do
      @grey = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @meredith = @grey.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      
      @katie = @meredith.patients.create!(name:"Katie Bryce", age: 24)
      @denny = @meredith.patients.create!(name:"Denny Duquette", age: 39)
      @rebecca = @meredith.patients.create!(name:"Rebecca Pope", age: 32)
      @zola = @meredith.patients.create!(name:"Zola Shepherd", age: 2)
    end
    
    it ".in_order" do
      expect(Patient.in_order.count).to eq(4)
      expect(Patient.in_order.first).to eq(@denny)
      expect(Patient.in_order.last).to eq(@zola)
    end
  end
end

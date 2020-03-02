require 'rails_helper'

RSpec.describe Patient, type: :model do 

  describe 'validations' do 
    it { should validate_presence_of :name}
    it { should validate_presence_of :age} 
  end 

  describe 'relationships' do 
    it { should have_many :doctor_patients}
    it { should have_many(:doctors).through(:doctor_patients) }
  end 

  describe 'methods' do

    describe '#in_order' do 

      it "it can order the patients from oldest to youngest" do
        @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
        @hospital2 = Hospital.create!(name: "Pacific Northwest General Hospital")
        @hospital3 = Hospital.create!(name: "New York Hospital")

        @doctor1 = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
        @doctor2 = @hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
        @doctor3 = @hospital2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
        @doctor4 = @hospital3.doctors.create!(name: "Derek Webber", specialty: "Attending Surgeon", university: "University of Pennsylvania")
        
        @patient1  = @doctor1.patients.create!(name: "Katie Bryce", age: 24)
        @patient2  = @doctor2.patients.create!(name: "Denny Duquette", age: 39)
        @patient3  = @doctor1.patients.create!(name: "Rebecca Pope", age: 32)
        @patient4  = @doctor1.patients.create!(name: "Zola Shepherd", age: 2)

        expect(Patient.in_order).to eq([@patient2, @patient3, @patient1, @patient4])

      end

    end

  end
end
require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe 'methods' do 

    describe '#number_of_doctors' do 

      it "it can count the number of doctors in the hospital" do

        @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
        @hospital2 = Hospital.create!(name: "Pacific Northwest General Hospital")

        @doctor1 = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
        @doctor2 = @hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
        @doctor3 = @hospital2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

        expect(@hospital1.number_of_doctors).to eq(2)
        expect(@hospital2.number_of_doctors).to eq(1)

      end

    end

    describe '#universities_attended' do 

      it "it lists the universities attended by the doctors in the hospital" do

        @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
        @hospital2 = Hospital.create!(name: "Pacific Northwest General Hospital")

        @doctor1 = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
        @doctor2 = @hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
        @doctor3 = @hospital2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

        expect(@hospital1.universities_attended).to eq(["Harvard University", "Johns Hopkins University"])
        expect(@hospital2.universities_attended).to eq(["Stanford University"])

      end

    end

  end
end

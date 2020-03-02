require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe 'methods' do
    it " distinct schools  " do
      # Patient.destroy_all
      # Doctor.destroy_all
      # Hospital.destroy_all

           hospital1 = Hospital.create(
             name: "Grey Sloan Memorial Hospital"
             )
           hospital2 = Hospital.create(
             name: "Pacific Northwest General Hospital"
             )
           doc1 = Doctor.create!(
               name: "Meredith Grey",
               specialty: "General Surgery",
               university: "Harvard",
               hospital: hospital1
             )
           doc2 = Doctor.create!(
               name: "Alex Karev",
               specialty: "Pediatric Surgery",
               university: "Johns Hopkins University",
               hospital: hospital1
             )
           doc3 = Doctor.create!(
               name: "Miranda Bailey",
               specialty: "General Surgery",
               university: "Stanford University",
               hospital: hospital2
             )
           doc4 = Doctor.create!(
               name: "Mike",
               specialty: "Backs",
               university: "Johns Hopkins University",
               hospital: hospital1
             )
           expect(hospital1.unique_schools.pluck(:university)).to eq(["Harvard", "Johns Hopkins University"])
         end
       end
     end

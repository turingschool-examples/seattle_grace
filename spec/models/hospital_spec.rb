require 'rails_helper'

RSpec.describe Hospital, type: :model do
  before :each do
    @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')

    @doc_1 = @hospital_1.doctors.create!( name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University' )
    @doc_2 = @hospital_1.doctors.create!( name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University' )
    @doc_3 = @hospital_1.doctors.create!( name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University' )

    @doc_1.patients.create!(name: 'Katie Bryce', age: 24 )
    @doc_1.patients.create!( name: 'Denny Duquette', age: 39 )
    @doc_2.patients.create!( name: 'Rebecca Pope', age: 32 )
  end

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe 'model methods' do
    it '.doctor_count' do
      expect(@hospital_1.doctor_count).to eq(3)
    end

    it '.university_list' do
      expected = [@doc_1.university, @doc_2.university, @doc_3.university]
      expect(@hospital_1.university_list).to eq(expected)
    end
  end
end

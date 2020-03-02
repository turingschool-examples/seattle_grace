require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe 'methods' do
    before :each do
      @hospital = Hospital.create!(name: 'Parkland Hospital')
      @tron = @hospital.doctors.create!(name: 'Dr. Tron Kattington', specialty: 'Attending Surgeon', university: 'University of Mind Ya Business')
      @kat = @hospital.doctors.create!(name: 'Dr. Katton Tronson', specialty: 'Attending Surgeon', university: 'University of Why You Askin')
      @patient1 = @tron.patients.create!(name: 'Joe', age: 20)
      @patient2 = @tron.patients.create!(name: 'Becky', age: 22)
      @patient3 = @kat.patients.create!(name: 'John', age: 20)
    end

    it '#num_of_doctors' do
      expect(@hospital.num_of_doctors).to eq(2)
    end

    it '#universities' do
      expect(@hospital.universities).to eq(["University of Mind Ya Business", "University of Why You Askin"])
    end
  end
end

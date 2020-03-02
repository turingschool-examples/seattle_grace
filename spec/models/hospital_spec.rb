require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end
  describe 'methods' do
    it 'should give unique list of doctor universities' do
      hospital2 = Hospital.create!(name: 'Hospital in Boulder')
      doctor2 = hospital2.doctors.create!(name: 'Steve', specialty: 'Adults', university: 'Yale')
      doctor3 = hospital2.doctors.create!(name: 'Chris', specialty: 'Children', university: 'Yale')
      doctor4 = hospital2.doctors.create!(name: 'Larry', specialty: 'Life', university: 'Stanford')

      expect(hospital2.docs_university).to eq(['Stanford', 'Yale'])
    end
  end
end

require 'rails_helper'

RSpec.describe Surgery, type: :model do
  before :each do
    @hospital_1 = Hospital.create!(name: 'Grey Sloan Memorial Hospital')

    @doc_1 = @hospital_1.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
    @doc_2 = @hospital_1.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')

    @surgery_1 = Surgery.create!(title: 'Gallbladder Removal', day: 'Friday', operating_room: 121)
    @surgery_2 = Surgery.create!(title: 'Photorefractive Kerectonomy', day: 'Monday', operating_room: 206)
    @surgery_3 = Surgery.create!(title: 'Limb Amputation', day: 'Friday', operating_room: 56)

    @doc_1.doctor_surgeries.create!(surgery_id: @surgery_1.id, doctor_id: @doc_1.id)
    @doc_2.doctor_surgeries.create!(surgery_id: @surgery_1.id, doctor_id: @doc_2.id)
  end
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :day }
    it { should validate_presence_of :operating_room }
  end

  describe 'relationships' do
    it { should have_many :doctor_surgeries }
    it { should have_many(:doctors).through(:doctor_surgeries) }
  end

  describe 'model methods' do
    it '.doc_count' do
      expect(@surgery_1.doc_count).to eq(2)
    end

    it '.surgeries_today' do
      expected = [@surgery_1, @surgery_3]
      expect(@surgery_1.surgeries_today).to eq(expected)
    end
  end
end

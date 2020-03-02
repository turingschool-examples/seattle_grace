require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end


  it '#distinct_universities' do
    @hospital_1 = Hospital.create(name: "Grey Sloan Memorial Hospital")
    @doctor_1 = @hospital_1.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @doctor_2 = @hospital_1.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")

    expect(@hospital_1.distinct_universities.first).to eq("Harvard University")
    expect(@hospital_1.distinct_universities.last).to eq("Johns Hopkins University")
  end

  it '#count_doctors' do
    @hospital_1 = Hospital.create(name: "Grey Sloan Memorial Hospital")
    @doctor_1 = @hospital_1.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @doctor_2 = @hospital_1.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")

    expect(@hospital_1.count_doctors).to eq(2)
  end
end

require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should have_many(:patients).through(:doctors)}
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe "instance methods" do
    before :each do
      #hospitals
      @greysloan = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @pacific = Hospital.create!(name: "Pacific Northwest General Hospital")
      @newyork = Hospital.create!(name: "New York Hospital")
      @seattle = Hospital.create!(name: "Seattle Grace Hospital")
      #doctors
      @merideth = Doctor.create!(name: "Meredith Grey", specialty:"General Surgery", university: "Harvard University", hospital: @seattle)
      @alex = Doctor.create!(name: "Alex Karev", specialty:"Pediatric Surgery", university: "Johns Hopkins University", hospital: @seattle)
      @miranda = Doctor.create!(name: "Miranda Bailey", specialty:"General Surgery", university: "Stanford University", hospital: @seattle)
      @derek = Doctor.create!(name: "Derek Webber", specialty:"Attending Surgeon", university: "University of Pennsylvania", hospital: @seattle)
    end

    it ".doctor_count" do
      expect(@seattle.doctor_count).to eq(4)
      expect(@greysloan.doctor_count).to eq(0)
    end

    it ".distinct_universities" do
      expect(@seattle.distinct_universities(@seattle)).to eq(["University of Pennsylvania", "Johns Hopkins University", "Harvard University", "Stanford University"])
    end
  end
end

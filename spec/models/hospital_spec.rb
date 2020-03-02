require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe "instance methods" do
    before(:each) do
      @hospital1 = Hospital.create(name: "Seattle Grace")
      @hospital2 = Hospital.create(name: "New York Hospital")

      @doctor1 = @hospital1.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @doctor2 = @hospital1.doctors.create(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
      @doctor3 = @hospital2.doctors.create(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      @doctor4 = @hospital2.doctors.create(name: "Derek Webber", specialty: "Attending Surgeon", university: "University of Pennsylvania")

      @patient1 = @doctor1.patients.create(name: "Katie Bryce", age: 24)
      @patient2 = @doctor1.patients.create(name: "Denny Duquette", age: 39)
      @patient3 = @doctor2.patients.create(name: "Rebecca Pope", age: 32)
      @patient4 = @doctor2.patients.create(name: "Zola Shepherd", age: 2)
    end

    it ".get_count_of_doctors"  do
      expect(@hospital1.get_count_of_doctors).to eq(2)
    end

    it ".get_universities"  do
      expect(@hospital2.get_universities).to eq(["Stanford University", "University of Pennsylvania"])
      expect(@hospital1.get_universities).to eq(["Harvard University", "Johns Hopkins University"])
    end
  end
end

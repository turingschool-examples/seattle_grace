require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end
  describe "methods" do
    it "sum the total number of doctors" do
      hs1 = Hospital.create!(name: "Johns Hopkins")
      dr1 = hs1.doctors.create!(name: "Matt", specialty: "brains", university: "GVSU", )
      dr2 = hs1.doctors.create!(name: "Meghan", specialty: "holistics", university: "Community College")
      dr3 = hs1.doctors.create!(name: "Zeke", specialty: "kidney stuff", university: "Community College")

      expected_result = 3

      expect(hs1.total_doctor_count).to eq(expected_result)
    end

    it "can list unique universities" do
      hs1 = Hospital.create!(name: "Johns Hopkins")
      dr1 = hs1.doctors.create!(name: "Matt", specialty: "brains", university: "GVSU", )
      dr2 = hs1.doctors.create!(name: "Meghan", specialty: "holistics", university: "Community College")
      dr3 = hs1.doctors.create!(name: "Zeke", specialty: "kidney stuff", university: "Community College")

      expected_result = [dr1.university, dr2.university]

      expect(hs1.unique_universities).to eq(expected_result)
    end
  end
end

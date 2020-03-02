require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe "methods" do
    it "#num_doctors" do
      hos1 = Hospital.create(name: "St. Marry's")
      dr1 = hos1.doctors.create(name: "Marry", specialty: "Brain Surgen", university: "Denver University")
      dr4 = hos1.doctors.create(name: "Matt", specialty: "Knee replacments", university: "ASU")
      dr5 = hos1.doctors.create(name: "Tye", specialty: "Blood", university: "ASU")

      expect(hos1.num_doctors).to eq(3)
    end

    it "#doc_universities" do
      hos1 = Hospital.create(name: "St. Marry's")
      dr1 = hos1.doctors.create(name: "Marry", specialty: "Brain Surgen", university: "Denver University")
      dr4 = hos1.doctors.create(name: "Matt", specialty: "Knee replacments", university: "ASU")
      dr5 = hos1.doctors.create(name: "Tye", specialty: "Blood", university: "ASU")

      expect(hos1.doc_universities).to eq([dr1.university, dr4.university])
    end
  end
end

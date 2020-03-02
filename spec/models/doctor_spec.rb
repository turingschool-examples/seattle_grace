require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :specialty}
    it {should validate_presence_of :university}
  end
  describe 'relationships' do
    it {should belong_to :hospital}
    it {should have_many :doctor_patients}
    it {should have_many(:patients).through(:doctor_patients)}
  end

  describe "class methods" do
    it ".unique_education" do
      grey_hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")

      meredith = grey_hospital.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      alex = grey_hospital.doctors.create(name: "Alex Gallant", specialty: "General Surgery", university: "Harvard University")
      shane = grey_hospital.doctors.create(name: "Shane Walton", specialty: "General Surgery", university: "University of Maine")
      gordon = grey_hospital.doctors.create(name: "Gordon Webb", specialty: "General Surgery", university: "Duke University")

      expect(grey_hospital.doctors.unique_education.count).to eq(3)
    end
  end
end

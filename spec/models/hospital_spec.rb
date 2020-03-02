require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe "instance methods" do
    it ".number_of_doctors" do
      grey_hospital = Hospital.create(name: "Grey Sloan Memorial Hospital")

      meredith = grey_hospital.doctors.create(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      alex = grey_hospital.doctors.create(name: "Alex Gallant", specialty: "General Surgery", university: "Harvard University")
      shane = grey_hospital.doctors.create(name: "Shane Walton", specialty: "General Surgery", university: "University of Maine")
      gordon = grey_hospital.doctors.create(name: "Gordon Webb", specialty: "General Surgery", university: "Duke University")

      expect(grey_hospital.number_of_doctors).to eq(4)
    end
  end
end

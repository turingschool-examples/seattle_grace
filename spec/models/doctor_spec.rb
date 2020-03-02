require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :specialty}
    it {should validate_presence_of :university}
  end

  describe 'Relationships' do
    it {should belong_to :hospital}
		it {should have_many :doctor_patients}
		it {should have_many(:patients).through(:doctor_patients)}
  end

	describe 'Methods' do
		before :each do
			@north = Hospital.create!(name: "North Hospital")
			@south = Hospital.create!(name: "South Hospital")
			@west = Hospital.create!(name: "west Hospital")

			@phil = @north.doctors.create!(name: 'Phil', specialty: "Love", university: "Love School")
			@john = @north.doctors.create!(name: 'John', specialty: "Pediactrics", university: "Hampden University")
			@hellen = @north.doctors.create!(name: 'Hellen', specialty: "cranial", university: "Colorado State University")

			@daniel = @south.doctors.create!(name: "Daniel", specialty: "Cyropractor", university: "Colorado University")
			@sherry = @south.doctors.create!(name: "Sherry", specialty: "Vetrinarian", university: "Red Rocks University")
			@holly = @south.doctors.create!(name: "Holly", specialty: "Birth", university: "Harvard University")

			@matt = @west.doctors.create!(name: "Matt", specialty: "Hand Work", university: "Brown University")
			@shawn = @west.doctors.create!(name: "Shawn", specialty: "plastic surgery", university: "California University")
			@dillon = @west.doctors.create!(name: "Dillon", specialty: "Necolepcy", university: "Main University")
		end


		it '.uniq_universities' do
			expect(Doctor.uniq_universities).to eq(["Brown University", "California University", "Colorado State University", "Colorado University", "Hampden University", "Harvard University", "Love School", "Main University", "Red Rocks University"])
		end
	end
end

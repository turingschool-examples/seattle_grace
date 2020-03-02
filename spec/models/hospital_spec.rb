require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :doctors}
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

		it '.doctor_count' do
			expect(@north.doctor_count).to eq(3)
		end
	end 
end

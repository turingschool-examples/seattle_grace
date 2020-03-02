require 'rails_helper'

RSpec.describe Patient, method: :model do
	describe 'Validations' do
		it {should validate_presence_of :name}
		it {should validate_presence_of :age}
	end

	describe 'Relationships' do
		it {should have_many :doctor_patients}
		it {should have_many(:doctors).through(:doctor_patients)}
	end

	describe 'Methods' do
		before :each do
			@danny = Patient.create!(name: "Danny Moore", age: 35)
			@katie = Patient.create!(name: "Katie Bryce", age: 24)
			@denny = Patient.create!(name: "Denny Duquette", age: 39)
			@rebecca = Patient.create!(name: "Rebecca Pope", age: 32)
			@zola = Patient.create!(name: "Zola Shepherd", age: 2)
		end

		it '.uniq_name_list' do
			expect(Patient.uniq_name_list).to eq([@danny.name, @denny.name, @katie.name, @rebecca.name, @zola.name])
			expect(Patient.uniq_name_list).not_to eq([@denny.name, @danny.name, @rebecca.name, @katie.name, @zola.name])
		end
	end
end

require 'rails_helper'

describe Patient, type: :model do
        describe "validations" do
                it { should validate_presence_of :name }
                it { should validate_presence_of :age }
        end
        describe 'relationships' do
                it {should have_many :doctor_patients}
                it { should have_many(:doctors).through(:doctor_patients)}
        end

	describe "methods" do
        	it "all_names_alpha" do
                	patient1 = Patient.create( name: 'Katie Bryce', age: 24)
                	patient2 = Patient.create( name: 'Denny Duquette', age: 39)
                	patient3 = Patient.create( name: 'Rebecca Pope', age: 32)
                	expect(Patient.all_names_alpha).to eq(["Denny Duquette", "Rebecca Pope", "Katie Bryce"])
		end
	end
end


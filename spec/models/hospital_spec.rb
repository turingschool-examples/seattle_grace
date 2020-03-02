require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  describe 'relationships' do
    it {should have_many :doctors}
  end


	describe 'methods' do
		before(:each) do
			@hospital1 = Hospital.create( name: 'Grey Sloan Memorial Hospital')
        		@hospital2 = Hospital.create( name: 'Pacific Northwest General Hospital')
		        @doc1 = Doctor.create(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University', hospital: @hospital2)
       			@doc2 = Doctor.create(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University', hospital: @hospital2)
       			@doc3 = Doctor.create(name: 'Alrev', specialty: 'Pediargery', university: 'Johns Hopkins University', hospital: @hospital2)
end	
		it "doc_count" do
			expect(@hospital2.doc_count).to eq(3)	
		end

		it "uniq_universities" do
			expect(@hospital2.uniq_universities).to eq(["Harvard University", "Johns Hopkins University"])
		end
	end
end


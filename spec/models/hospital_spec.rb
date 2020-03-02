require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end
  
  describe 'relationships' do
    it {should have_many :doctors}
  end
  
  describe 'methods' do
    before :each do
      @grey = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      
      @meredith = @grey.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @alex = @grey.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Harvard University")
      @miranda = @grey.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    end
    
    it "#num_doctors" do
      expect(@grey.num_doctors).to eq(3)
    end
    
    it "#unique_universities" do
      expected = ["Harvard University", "Stanford University"]
      expect(@grey.unique_universities).to eq(expected)
    end
  end
end

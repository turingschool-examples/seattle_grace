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

  describe "instance methods" do
    before :each do
      #hospitals
      @greysloan = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @pacific = Hospital.create!(name: "Pacific Northwest General Hospital")
      @newyork = Hospital.create!(name: "New York Hospital")
      @seattle = Hospital.create!(name: "Seattle Grace Hospital")
      #doctors
      @merideth = Doctor.create!(name: "Meredith Grey", specialty:"General Surgery", university: "Harvard University", hospital: @seattle)
      @alex = Doctor.create!(name: "Alex Karev", specialty:"Pediatric Surgery", university: "Johns Hopkins University", hospital: @seattle)
      @miranda = Doctor.create!(name: "Miranda Bailey", specialty:"General Surgery", university: "Stanford University", hospital: @seattle)
      @derek = Doctor.create!(name: "Derek Webber", specialty:"Attending Surgeon", university: "University of Pennsylvania", hospital: @seattle)
      #patients
      @katie = Patient.create!(name: "Katie Bryce", age: 24)
      @denny = Patient.create!(name: "Denny Duquette", age: 39)
      @rebecca = Patient.create!(name: "Rebecca Pope", age: 32)
      @zola = Patient.create!(name: "Zola  Shepherd", age: 2)

      @doctor_patient1 = DoctorPatient.create!(doctor: @merideth, patient: @katie)
      @doctor_patient2 = DoctorPatient.create!(doctor: @merideth, patient: @rebecca)
    end

    it ".doctr_patient" do
      expect(@merideth.doctr_patient(@merideth, @katie)).to eq(@doctor_patient1.id)
      expect(@merideth.doctr_patient(@merideth, @rebecca)).to eq(@doctor_patient2.id)
    end
  end
end

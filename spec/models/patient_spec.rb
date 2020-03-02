require 'rails_helper'

 describe Patient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe 'relationships' do
    it {should have_many :doctors}
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe "class methods" do
    before :each do
      #hospitals
      @seattle = Hospital.create!(name: "Seattle Grace Hospital")
      #doctors
      @merideth = Doctor.create!(name: "Meredith Grey", specialty:"General Surgery", university: "Harvard University", hospital: @seattle)
      #patients
      @katie = Patient.create!(name: "Katie Bryce", age: 24)
      @denny = Patient.create!(name: "Denny Duquette", age: 39)
      @rebecca = Patient.create!(name: "Rebecca Pope", age: 32)
      @zola = Patient.create!(name: "Zola  Shepherd", age: 2)

      @doctor_patient1 = DoctorPatient.create!(doctor: @merideth, patient: @katie)
      @doctor_patient2 = DoctorPatient.create!(doctor: @merideth, patient: @rebecca)
      @doctor_patient3 = DoctorPatient.create!(doctor: @merideth, patient: @denny)
      @doctor_patient4 = DoctorPatient.create!(doctor: @merideth, patient: @zola)
    end

    it ".sorted_by_age" do
      expect(Patient.sorted_by_age).to eq([@zola, @katie, @rebecca, @denny])
    end
  end
end

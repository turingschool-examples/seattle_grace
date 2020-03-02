require 'rails_helper'

RSpec.describe Patient, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe "instance methods" do
    it "#find_patient_doctor" do
      hospital1 = Hospital.create!(name: "Sacred Heart")
      hospital2 = Hospital.create!(name: "Pacific Northwest General Hospital")

      doctor1 = Doctor.create!(name: "Turk", specialty: "Surgery", university: "Colorado University", hospital: hospital1)
      doctor2 = Doctor.create!(name: "Carla", specialty: "Nursing", university: "New Jersey University", hospital: hospital2)

      patient1 = Patient.create!(name: 'Zola Shepherd', age: 2)
      patient2 = Patient.create!(name: 'Rebecca Pope', age: 32)
      patient3 = Patient.create!(name: 'Denny Duquette', age: 39)

      doctor_patient1 = DoctorPatient.create!(doctor: doctor1, patient: patient1)
      doctor_patient2 = DoctorPatient.create!(doctor: doctor1, patient: patient2)
      doctor_patient3 = DoctorPatient.create!(doctor: doctor2, patient: patient3)

      expect(patient1.find_patient_doctor(doctor1).id).to eq(doctor_patient1.id)
    end
  end
end
